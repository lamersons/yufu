class Profile::BaseSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :middle_name, :phone, :additional_phone, :_type, :created_at, :updated_at,
             :type, :total_approve, :is_translator, :city_id

  # def links
  #   { orders: Rails.application.routes.url_helpers.api_v1_profile_orders_url(object) }
  # end

  def city_id
    object.city.try(:id).to_s
  end

  def type
    object.class.name.gsub '::', ''
  end

  def is_translator
    @object.is_a? Profile::Translator::Base
  end
end
