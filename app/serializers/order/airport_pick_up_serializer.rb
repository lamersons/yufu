class Order::AirportPickUpSerializer < ActiveModel::Serializer
  include MongoIdSerializer
  attributes :id, :need_car, :double_way, :flight_number, :airport, :arriving_date
end
