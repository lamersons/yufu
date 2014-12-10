module Order
  class Payment
    include Mongoid::Document

    belongs_to :order_verbal, class_name: 'Order::Verbal'



    field :state
    field :gateway_class

  end
end