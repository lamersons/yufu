class TranslationSerializer < ActiveModel::Serializer
  attributes :id, :value, :original

  def id
    @object.key
  end
end
