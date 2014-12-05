class Order::ApplicationSerializer < ActiveModel::Serializer
  attributes :id, :status
end
