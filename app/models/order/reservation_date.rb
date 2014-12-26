module Order
  class ReservationDate
    include Mongoid::Document

    field :date,  type: Date
    field :hours, type: Integer, default: 8
    field :human_made, type: Boolean, default: true
    belongs_to :order_language_criterion, class_name: 'Order::LanguageCriterion'
    embedded_in :order_verbal, class_name: 'Order::Verbal'

    validates_presence_of    :date
    validates_uniqueness_of  :date, scope: [:order_verbal]

    delegate :language, :level, to: :order_language_criterion, allow_nil: true

    scope :made_by_human, -> {where human_made: true}

    def available?(language = nil, level = nil)
      language = language || order_language_criterion.try(:language)
      level    = level || order_language_criterion.try(:level)
      !Profile::Translator::Individual.free_on(date).support(language, level).empty?
    end
    alias :available_for? :available?

    def available_level(language = nil)
      return level if available?(language)
      Order::Verbal::TRANSLATION_LEVELS.reverse.each do |lvl|
        return lvl if available?(language, lvl)
      end
    end

    def fake?
      order_language_criterion_id.nil?
    end

    def price_for_hours

    end

    def price(currency = nil)
      Price.with_markup cost(currency)
    end

    def cost(currency = nil)
      language_criterion = order_language_criterion || order_verbal.main_language_criterion
      if hours <= 8
        language_criterion.cost(currency) * hours
      else
        cost_by_hour = language_criterion.cost(currency)
        cost_by_hour * 8 + 1.5 * cost_by_hour * (hours - 8)
      end
    end
  end
end
