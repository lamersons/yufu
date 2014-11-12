module Order
  class Base
    include Mongoid::Document
    include Mongoid::Timestamps

    belongs_to :client_info, class_name: 'Order::ClientInfo'
    belongs_to :owner,       class_name: 'User'
    belongs_to :assignee,    class_name: 'User'

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
    end

    def assigned_to(user)
      raise ArgumentError, 'user should be translator' unless user.translator?
      self.assignee = user
      super
    end
  end
end