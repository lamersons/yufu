module Order
  class Base
    include Mongoid::Document
    include Mongoid::Timestamps

    SCOPES = %w(open in_progress close)
    PAY_WAYS = %w(card bank alipay)

    field :step, type: Integer, default: 1
    field :pay_way

    embeds_one :client_info,     class_name: 'Order::ClientInfo'
    belongs_to :owner,           class_name: 'Profile::Base'
    belongs_to :assignee,        class_name: 'Profile::Translator::Base'
    belongs_to :profile_partner, class_name: 'Profile::Partner'

    # Additional Options
    embeds_one :airport_pick_up, class_name: 'Order::AirportPickUp'
    embeds_one :car_rent,        class_name: 'Order::CarRent'
    embeds_one :hotel,           class_name: 'Order::Hotel'

    has_many :applications, class_name: 'Order::Application', dependent: :destroy

    accepts_nested_attributes_for :airport_pick_up, :car_rent, :hotel
    accepts_nested_attributes_for :client_info

    scope :open,        -> (profile = nil) { where state: :wait_application }
    scope :in_progress, -> (profile) do
      where :state.in => [:in_progress, :additional_paying], connected_method_for(profile) => profile
    end
    scope :close,       -> (profile) do
      where :state.in => [:close, :rated], connected_method_for(profile) => profile
    end

    # Order's workflow
    state_machine initial: :new do
      state :paying
      state :wait_application
      state :additional_paying
      state :in_progress
      state :close
      state :rated

      event :paying do
        transition [:new] => :paying
      end

      event :paid do
        transition [:paying, :additional_paying] => :wait_application
      end

      event :unpaid do
        transition [:wait_application, :additional_paying] => :paying
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

    def paid?
      state == 'close' || state == 'rated' || state == 'closed' || state == 'wait_application'
    end

    def application_status_for(profile)
      applications.where(translator: profile).first.try(:status)
    end

    def assigned_to(translator_profile)
      raise ArgumentError, 'user should be translator' unless translator_profile.is_a? Profile::Translator::Base
      self.assignee = translator_profile
      super
    end

    def can_send_primary_application?
      applications.where(status: 'primary').empty?
    end

    def self.connected_method_for(profile)
      if profile.is_a? Profile::Translator::Base
        :assignee
      else
        :owner
      end
    end

  end
end