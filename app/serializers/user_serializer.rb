class UserSerializer < ActiveModel::Serializer
  include MongoIdSerializer

  attributes :id, :email
end
