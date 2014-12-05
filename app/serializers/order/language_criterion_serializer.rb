class Order::LanguageCriterionSerializer < ActiveModel::Serializer
  attributes :id, :level, :cost
end
