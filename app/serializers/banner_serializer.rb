class BannerSerializer < ActiveModel::Serializer
  include MongoIdSerializer
  attributes :id, :name, :width, :height, :src, :created_at, :updated_at
end
