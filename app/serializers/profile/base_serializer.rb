class Profile::BaseSerializer < ActiveModel::Serializer
  include MongoIdSerializer

  attributes :id, :first_name, :last_name, :middle_name, :phone, :additional_phone, :_type, :created_at, :updated_at

  # def links
  #   { orders: Rails.application.routes.url_helpers.api_v1_profile_orders_url(object) }
  # end
end
