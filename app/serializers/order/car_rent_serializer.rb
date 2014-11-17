class Order::CarRentSerializer < ActiveModel::Serializer
  include MongoIdSerializer

  attributes :id, :duration, :cost
  has_one :car
end
