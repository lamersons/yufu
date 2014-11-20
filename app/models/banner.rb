class Banner
  include Mongoid::Document
  include Mongoid::Paperclip

  field :name
  field :width,  type: Float, default: 100.0
  field :height, type: Float, default: 100.0

  belongs_to :user

  has_mongoid_attached_file :image
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  def html
    #"<iframe width=#{width} height=#{height} src='#{banner_url(self)}'></iframe"
  end
end
