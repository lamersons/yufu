module Order
  class AirportPickUp
    include Mongoid::Document

    field :need_car,      type: Mongoid::Boolean
    field :double_way,    type: Mongoid::Boolean
    field :flight_number, type: String
    field :airport,       type: String
    field :arriving_date, type: DateTime

    embedded_in :order_base
  end
end
