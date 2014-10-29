class LanguageSerializer < ActiveModel::Serializer
  include MongoIdSerializer

  attributes :id, :name
end
