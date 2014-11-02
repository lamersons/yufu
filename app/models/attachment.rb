class Attachment
  include Mongoid::Document
  include Mongoid::Timestamps

  has_mongoid_attached_file :file

  do_not_validate_attachment_file_type :file
end