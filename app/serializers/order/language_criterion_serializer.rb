class Order::LanguageCriterionSerializer < ActiveModel::Serializer
  include MongoIdSerializer
  attributes :id, :level, :cost
end
