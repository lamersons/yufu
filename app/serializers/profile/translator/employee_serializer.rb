class Profile::Translator::EmployeeSerializer < ActiveModel::Serializer
  include MongoIdSerializer
  attributes :id, :first_name, :last_name, :middle_name, :sex
end
