class Order::HotelSerializer < ActiveModel::Serializer
  include MongoIdSerializer
  attributes :id, :greeted_at, :info, :additional_info
end
