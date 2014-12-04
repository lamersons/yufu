module Profile
  class Education
    include Mongoid::Document

    before_update :set_doc_file_name

    field :grade,          localize: true
    field :specialization, localize: true
    field :university,     localize: true
    field :location,       localize: true

    embedded_in :profile_translator_individual
    embeds_many :attachments
    embeds_many :documents, class_name: 'Profile::Translator::Document'
    accepts_nested_attributes_for :documents

    def set_doc_file_name
      documents.each do |doc|
        doc.doc
      end
    end

  end
end