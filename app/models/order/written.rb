module Order
  class Written < Base
    include Mongoid::Paperclip

    TYPES  = %w(law technical  standard artistic site_localisation language_localisation)
    LEVELS = %w(translate_and_correct translate)

    field :translation_type
    field :words_number, type: Integer, default: 0
    field :level

    has_mongoid_attached_file :file
    do_not_validate_attachment_file_type :file

    belongs_to :original_language,                   class_name: 'Language'
    has_and_belongs_to_many :translation_languages,  class_name: 'Language'
    has_and_belongs_to_many :available_languages,    class_name: 'Language'

    embeds_one :get_translation,                     class_name: 'Order::GetTranslation'
    embeds_one :get_original,                        class_name: 'Order::GetOriginal'
    accepts_nested_attributes_for :get_original, :get_translation

    def cost(currency = nil, curr_level = level)
      (translation_languages.inject(0) {|sum, l| sum + l.written_cost(translation_type, currency)}) * words_number
    end

    def price(currency = nil, curr_level = level)
      Price.with_markup(cost currency, curr_level)
    end
  end
end