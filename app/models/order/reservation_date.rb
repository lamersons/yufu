module Order
  class ReservationDate
    include Mongoid::Document

    field :date,  type: Date
    field :hours, type: Integer, default: 8
    belongs_to :order_language_criterion, class_name: 'Order::LanguageCriterion'
    embedded_in :order_verbal, class_name: 'Order::Verbal'

    validates_presence_of    :date
    validates_uniqueness_of  :date, scope: [:order_verbal]

    delegate :language, :level, to: :order_language_criterion, allow_nil: true

    def fake?
      order_language_criterion_id.nil?
    end

    def price_for_hours

    end

    def price(currency = nil)
      Price.with_markup cost(currency)
    end

    def cost(currency = nil)
      if hours <= 8
        order_language_criterion.cost(currency) * hours
      else
        cost_by_hour = order_language_criterion.cost(currency)
        cost_by_hour * 8 + 1.5 * cost_by_hour * (hours - 8)
      end
    end
  end
end
