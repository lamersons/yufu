class Profile::BaseSerializer < ActiveModel::Serializer
  include MongoIdSerializer

  attributes :id, :first_name, :last_name, :middle_name, :phone, :additional_phone, :_type, :created_at, :updated_at
end
