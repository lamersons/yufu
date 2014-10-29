class CitySerializer < ActiveModel::Serializer
  include MongoIdSerializer

  attributes :id, :name, :language_id
end
