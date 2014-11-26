class Order::ApplicationSerializer < ActiveModel::Serializer
  include MongoIdSerializer
  attributes :id, :status
end
