module  Order
  class Application
    include Mongoid::Document

    STATUSES = %w(primary secondary)

    field :status, default: 'secondary'

    belongs_to :translator, class_name: 'User'
    belongs_to :order,      class_name: 'Order::Base'

    validates :translator, translator: true, presence: true
    validates_presence_of :order
    validates_inclusion_of :status, in: STATUSES
  end
end
