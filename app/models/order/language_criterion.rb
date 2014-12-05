module Order
  class LanguageCriterion
    include Mongoid::Document
    LEVELS = [1, 2, 3]

    field :level
    field :cost,  type: Float
    belongs_to :language

    embedded_in :order_verbal
    has_many :order_reservation_dates, :class_name => 'Order::ReservationDate'

    def cost(currency = nil)
      language.verbal_cost level, currency
    end
  end
end