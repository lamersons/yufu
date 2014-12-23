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

    belongs_to :original_language,                      class_name: 'Language'
    has_and_belongs_to_many :translation_languages,  class_name: 'Language'
    has_and_belongs_to_many :available_languages,    class_name: 'Language'

    embeds_one :get_translation,                     class_name: 'Order::GetTranslation'
    embeds_one :get_original,                        class_name: 'Order::GetOriginal'
    accepts_nested_attributes_for :get_original, :get_translation

    def price(curr_level = level)
      sum = 0
      translation_languages.each do |tl|
        sum+=Price.with_markup(tl.languages_group.written_cost(curr_level))
      end
      (sum*words_number).round(2)
    end
  end
end