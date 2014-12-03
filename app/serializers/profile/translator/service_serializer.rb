class Profile::Translator::ServiceSerializer < ActiveModel::Serializer
  include MongoIdSerializer

  attributes :id, :level, :has_hsk, :verbal_price, :written_price, :written_translate_type, :language_id

  def language_id
    object.language.try(:id).to_s
  end

  def id
    object.id.to_s
  end
end
