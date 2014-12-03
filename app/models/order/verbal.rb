module Order
  class Verbal < Base

    GENDERS = ['male', 'female']
    GOALS   = ['business', 'entertainment']
    DEFAULTCOST = 115.0


    field :translation_level
    field :include_near_city, type: Mongoid::Boolean, default: false
    field :goal
    field :translator_sex

    belongs_to :location, class_name: 'City'
    belongs_to :translator_native_language, class_name: 'Language'
    belongs_to :native_language,            class_name: 'Language'

    embeds_many :language_criterions, class_name: 'Order::LanguageCriterion'
    embeds_many :reservation_dates,   class_name: 'Order::ReservationDate'

    accepts_nested_attributes_for :language_criterions, allow_destroy: true
    accepts_nested_attributes_for :reservation_dates, allow_destroy: true

    has_and_belongs_to_many :directions

    delegate :name, to: :location, prefix: true, allow_nil: true

    def sum
      reservation_dates.inject(0.0) do |sum, elem|
        sum += Order::Verbal::DEFAULTCOST*(1+(elem.hours-8)*1.5/8)
      end
    end

    def cost

    end
  end
end