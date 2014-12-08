module Profile
  class Education
    include Mongoid::Document

    field :grade,          localize: true
    field :specialization, localize: true
    field :university,     localize: true
    field :location,       localize: true
    field :is_approved,    type: Mongoid::Boolean
    embedded_in :profile_translator_individual
    embeds_many :documents, class_name: 'Profile::Translator::Document', :cascade_callbacks => true
    accepts_nested_attributes_for :documents

    def name
      university
    end

  end
end