class Order::ReservationDateSerializer < ActiveModel::Serializer
  include MongoIdSerializer
  attributes :id, :date, :hours
end
