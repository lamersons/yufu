class Profile::EducationSerializer < ActiveModel::Serializer
  include MongoIdSerializer

  attributes :id, :grade, :specialization, :location, :university
end
