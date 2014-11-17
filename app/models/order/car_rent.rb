module Order
  class CarRent
    include Mongoid::Document

    field :duration, type: Integer, default: 0
    belongs_to :car, class_name: 'Order::Car'

    embedded_in :order_base

    validates_presence_of :car

    def cost
      car.cost * duration
    end
  end
end