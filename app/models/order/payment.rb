module Order
  class Payment
    include Mongoid::Document

    after_save :check_if_paid

    belongs_to :order, class_name: 'Order::Base', inverse_of: :payments

    field :state, default: 'paying'
    field :gateway_class

    def paid
      update_attribute :state, 'paid'
    end

    def unpaid
      update_attribute :state, 'paying'
    end

    private
    def check_if_paid
      if state_changed? && state == 'paid'
        order_verbal.paid
      end
      if state_changed? && state_was == 'paid' && state == 'paying'
        order_verbal.unpaid
      end
      true
    end
  end
end