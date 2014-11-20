class Banner
  include Mongoid::Document
  include Mongoid::Paperclip
  include Mongoid::Timestamps

  field :name
  field :width,  type: Float, default: 100.0
  field :height, type: Float, default: 100.0

  belongs_to :user

  has_mongoid_attached_file :image, default_url: "/images/default_banner.jpg"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  def src
    "<iframe width=#{width} height=#{height} src='#{Rails.application.routes.url_helpers.banner_url(self)}'></iframe"
  end
end
