module Order
  class Written < Base

    TYPES = ['law', 'technical', 'standard', 'artistic', 'site_localisation', 'language_localisation']

    field :translation_type
    field :words_number, type: Integer

    has_one :original_language, class_name: 'Language'
    has_many :translation_languages, class_name: 'Language'
    has_and_belongs_to_many :available_languages, class_name: 'Language'
  end
end