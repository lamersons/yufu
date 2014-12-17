class Language
  include Mongoid::Document
  include Mongoid::Paperclip

  field :name, localize: true
  field :short_name

  belongs_to :languages_group

  has_mongoid_attached_file :flag
  validates_attachment_content_type :flag, content_type: /\Aimage\/.*\Z/

  validates_presence_of :name, uniqueness: true
  validates_presence_of :languages_group

  delegate :verbal_cost,  to: :languages_group, allow_nil: true
  delegate :written_cost, to: :languages_group, allow_nil: true
end
