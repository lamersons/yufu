module Profile
  module Translator
    class Document
      include Mongoid::Document
      include Mongoid::Paperclip
      before_save :set_doc_extension

      has_mongoid_attached_file :doc
      do_not_validate_attachment_file_type :doc

      embedded_in :profile_education

      private
      def set_doc_extension
        begin
          name = SecureRandom.uuid
        end while not Profile::Translator::Document.where(doc_file_name: name).empty?
        extension = self.doc_content_type.gsub('image/', '.')
        self.doc.instance_write(:file_name, name+extension)
      end
    end
  end
end