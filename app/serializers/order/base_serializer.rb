class Order::BaseSerializer < ActiveModel::Serializer
  include MongoIdSerializer
  attributes :id, :state, :type

  has_one :airport_pick_up
  has_one :car_rent
  has_one :hotel

  def type
    object._type.gsub '::', ''
  end
end
