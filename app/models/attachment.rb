class Attachment
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Paperclip

  has_mongoid_attached_file :data

  do_not_validate_attachment_file_type :data

  delegate :url, to: :data
end