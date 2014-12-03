class DirectionSerializer < ActiveModel::Serializer
  include MongoIdSerializer

  attributes :id, :name
end
