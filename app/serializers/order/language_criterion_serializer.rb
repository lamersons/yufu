class Order::LanguageCriterionSerializer < ActiveModel::Serializer
  attributes :id, :level, :cost, :language_id

  def language_id
    @object.language_id.to_s
  end
end
