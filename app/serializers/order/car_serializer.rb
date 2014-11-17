class Order::CarSerializer < ActiveModel::Serializer
  include MongoIdSerializer

  attributes :id, :name, :cost
end
