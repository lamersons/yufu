class BannerSerializer < ActiveModel::Serializer
  attributes :id, :name, :width, :height, :src, :created_at, :updated_at
end
