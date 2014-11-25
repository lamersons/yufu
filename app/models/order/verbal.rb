module Order
  class Verbal < Base

    GENDERS = ['male', 'female']
    GOALS = ['drink beer', 'drink vodka']

    field :translation_level
    field :include_near_city, type: Mongoid::Boolean, default: false
    field :goal
    field :translator_sex

    belongs_to :location, class_name: 'City'
    belongs_to :translator_native_language, class_name: 'Language'
    belongs_to :native_language,            class_name: 'Language'

    embeds_many :language_criterions, class_name: 'Order::LanguageCriterion'
    embeds_many :reservation_dates,   class_name: 'Order::ReservationDate'

    accepts_nested_attributes_for :language_criterions
    accepts_nested_attributes_for :reservation_dates

    has_and_belongs_to_many :directions


  end
end