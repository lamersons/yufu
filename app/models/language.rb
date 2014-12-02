class Language
  include Mongoid::Document
  include Mongoid::Paperclip

  field :name, localize: true

  belongs_to :languages_group

  has_mongoid_attached_file :flag
  validates_attachment_content_type :flag, content_type: /\Aimage\/.*\Z/

  validates_presence_of :name, uniqueness: true

  delegate :cost, to: :languages_group
end
