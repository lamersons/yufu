class Profile::Translator::ServiceSerializer < ActiveModel::Serializer
  include MongoIdSerializer

  attributes :id, :level, :has_hsk, :verbal_price, :written_price, :written_translate_type

  has_one :language
end
