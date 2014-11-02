module Profile
  class Education
    include Mongoid::Document

    field :grade,          localize: true
    field :specialization, localize: true
    field :university,     localize: true
    field :location,       localize: true

    embedded_in :profile_translator_individual
    embeds_many :attachments
  end
end