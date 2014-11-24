module Order
  class Base
    include Mongoid::Document
    include Mongoid::Timestamps

    field :step, type: Integer, default: 1

    belongs_to :client_info, class_name: 'Order::ClientInfo'
    belongs_to :owner,       class_name: 'Profile::Base'
    belongs_to :assignee,    class_name: 'Profile::Translator::Base'

    # Additional Options
    embeds_one :airport_pick_up, class_name: 'Order::AirportPickUp'
    embeds_one :car_rent,        class_name: 'Order::CarRent'
    embeds_one :hotel,           class_name: 'Order::Hotel'

    has_many :applications, class_name: 'Order::Application', dependent: :destroy

    accepts_nested_attributes_for :airport_pick_up, :car_rent, :hotel

    # Order's workflow
    state_machine initial: :new do
      state :paying
      state :wait_application
      state :additional_paying
      state :in_progress
      state :close
      state :rated

      event :paid do
        transition [:paying, :additional_paying] => :wait_application
      end

      event :assigned_to do
        transition wait_application: :in_progress
      end

      event :reject do
        transition in_progress: :wait_application
      end

      # It should be after, but it doesn't work with MongoId https://github.com/spree/spree/issues/2004
      before_transition on: :reject do |order|
        order.assignee = nil
      end

    end

    def assigned_to(translator_profile)
      raise ArgumentError, 'user should be translator' unless translator_profile.is_a? Profile::Translator::Base
      self.assignee = translator_profile
      super
    end

    def can_send_primary_application?
      applications.where(status: 'primary').empty?
    end
  end

end