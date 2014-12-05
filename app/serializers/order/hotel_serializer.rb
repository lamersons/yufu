class Order::HotelSerializer < ActiveModel::Serializer
  attributes :id, :greeted_at, :info, :additional_info
end
