class Order::BaseSerializer < ActiveModel::Serializer
  include MongoIdSerializer
  attributes :id, :state

  has_one :airport_pick_up
  has_one :car_rent
  has_one :hotel
end
