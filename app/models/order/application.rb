module  Order
  class Application
    include Mongoid::Document

    STATUSES = %w(primary secondary)

    field :status, default: 'secondary'

    belongs_to :translator, class_name: 'Profile::Translator::Base'
    belongs_to :order,      class_name: 'Order::Base'

    validates_presence_of :order
    validates_inclusion_of :status, in: STATUSES
    validates_inclusion_of :status, in: %w(secondary), on: :create, unless: :can_be_primary?

    before_save :processed_order, if: -> {status_changed? && status == 'primary'}

    def can_be_primary?
      order.can_send_primary_application?
    end

    protected
    def processed_order
      order.assigned_to translator
    end
  end
end
