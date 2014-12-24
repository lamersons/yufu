class Profile::BaseSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :middle_name, :phone, :additional_phone, :_type, :created_at, :updated_at,
             :type, :total_approve, :is_translator

  def type
    object.class.name.gsub '::', ''
  end

  def is_translator
    @object.is_a? Profile::Translator::Base
  end
end
