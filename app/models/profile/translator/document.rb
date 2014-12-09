module Profile
  module Translator
    class Document
      include Mongoid::Document
      include Mongoid::Paperclip

      before_save :set_extension

      has_mongoid_attached_file :doc
      do_not_validate_attachment_file_type :doc

      embedded_in :profile_education


      def set_extension
        if doc.nil?
          return true
        end
        begin
          name = SecureRandom.uuid
        end while !Profile::Translator::Document.where(doc_file_name: name).empty?
        extension = doc_content_type.gsub('image/', '.')
        doc.instance_write(:file_name, name+extension)
      end

    end
  end
end