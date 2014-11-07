module Profile::Translator
  class Employee
    include Mongoid::Document
    include Mongoid::Paperclip
    include Personalized

    field :sex, type: String
    field :age, type: Integer

    belongs_to :direction

    embedded_in :profile_translator_company

    validates_presence_of :direction

    has_mongoid_attached_file :avatar
    validates_attachment_content_type :avatar, content_type: %w(image/jpg image/jpeg image/png)
  end
end
