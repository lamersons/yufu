class Attachment
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Paperclip

  has_mongoid_attached_file :data

  do_not_validate_attachment_file_type :data

  delegate :url, to: :data

  validate :uploadfile_validation, if: 'data?'

  def uploadfile_validation
    errors[:data] << "should be less than 50MB" if data.size > 50.megabytes
  end
end