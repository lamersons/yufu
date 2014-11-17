module Order
  class LanguageCriterion
    include Mongoid::Document

    field :level, type: Integer
    field :cost,  type: Float
    embedded_in :order_verbal
  end
end