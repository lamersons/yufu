class BannerSerializer < ActiveModel::Serializer
  include MongoIdSerializer
  attributes :id, :name, :width, :height
end
