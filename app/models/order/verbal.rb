module Order
  class Verbal < Base


    # before_save :check_dates
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

    # TODO: should be removed
    def sum
      reservation_dates.inject(0.0) do |sum, elem|
        sum += Order::Verbal::DEFAULTCOST*(1+(elem.hours-8)*1.5/8)
      end
    end

    def additional_cost(currency = nil)
      10
    end

    def general_cost(currency = nil)
      reservation_dates.to_a.inject(0) { |sum, n| sum + n.cost(currency) }
    end

    def cost_price(currency = nil)
      general_cost(currency) + additional_cost(currency)
    end

    def price(currency = nil)
      cost_price(currency) / Order::MARKUP
    end

    private
    def check_dates
      reservation_dates.each do |date|
        if date.order_language_criterion.nil?
          language_criterions.each do |criterion|
            criterion.reservation_dates.create date
          end
          date.destroy
        end
      end
    end
  end
end