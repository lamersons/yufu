module Profile::Translator
  class Employee
    include Mongoid::Document
    include Personalized

    field :sex, type: String
    field :age, type: Integer

    belongs_to :direction

    embedded_in :profile_translator_company

    validates_presence_of :direction
  end
end
