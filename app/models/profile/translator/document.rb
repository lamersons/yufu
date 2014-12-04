module Profile
  module Translator
    class Document
      include Mongoid::Document
      include Mongoid::Paperclip

      has_mongoid_attached_file :doc
      do_not_validate_attachment_file_type :doc

      embedded_in :profile_education
    end
  end
end