module Order
  class Written < Base
    include Mongoid::Paperclip

    TYPES = ['law', 'technical', 'standard', 'artistic', 'site_localisation', 'language_localisation']
    LEVELS = ['translate_and_correct', 'translate']

    field :translation_type
    field :words_number, type: Integer
    field :level

    has_mongoid_attached_file :file
    do_not_validate_attachment_file_type :file

    has_one :original_language,                      class_name: 'Language'
    has_and_belongs_to_many :translation_languages,  class_name: 'Language'
    has_and_belongs_to_many :available_languages,    class_name: 'Language'

    embeds_one :get_translation,                     class_name: 'Order::GetTranslation'
    embeds_one :get_original,                        class_name: 'Order::GetOriginal'
  end
end