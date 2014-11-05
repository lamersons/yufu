module Order
  class Base
    include Mongoid::Document
    include Mongoid::Timestamps

    field :current_step, type: Integer, default: 0

    belongs_to :client_info, class_name: 'Order::ClientInfo'
    belongs_to :owner, class_name: 'User'

    # Additional Options
    embeds_one :airport_pick_up, class_name: 'Order::AirportPickUp'
    embeds_one :car_rent,        class_name: 'Order::CarRent'
    embeds_one :hotel,           class_name: 'Order::Hotel'

    accepts_nested_attributes_for :airport_pick_up, :car_rent, :hotel

    validates_numericality_of :current_step, greater_than_or_equal_to: 0, less_than_or_equal_to: 2
  end
end