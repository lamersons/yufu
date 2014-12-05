class Order::ReservationDateSerializer < ActiveModel::Serializer
  attributes :id, :date, :hours
end
