module Order
  class ReservationDate
    include Mongoid::Document

    field :date,  type: Date
    field :hours, type: Integer, default: 8
    belongs_to :order_language_criterion, class_name: 'Order::LanguageCriterion'
    embedded_in :order_verbal
  end
end
