module Order
  class Verbal < Base
    field :include_near_city, type: Mongoid::Boolean, default: false
    field :goal
    field :translator_sex

    belongs_to :location, class_name: 'City'
    belongs_to :translator_native_language, class_name: 'Language'
    belongs_to :native_language,            class_name: 'Language'

    embeds_many :language_criterions, class_name: 'Order::LanguageCriterion'
    embeds_many :reservation_dates,   class_name: 'Order::ReservationDate'

    has_and_belongs_to_many :directions



  end
end