class Profile::EducationSerializer < ActiveModel::Serializer
  attributes :id, :grade, :specialization, :location, :university
end
