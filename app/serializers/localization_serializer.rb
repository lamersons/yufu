class LocalizationSerializer < ActiveModel::Serializer
  attributes :id, :name, :enable, :language_name
end
