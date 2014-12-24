module Order
  class LanguageCriterion
    include Mongoid::Document

    field :level
    belongs_to :language

    belongs_to :main_socket,    class_name: 'Order::Verbal', inverse_of: :main_language_criterion
    belongs_to :reserve_socket, class_name: 'Order::Verbal', inverse_of: :reserve_language_criterions

    validates_inclusion_of :level, in: Order::Verbal::TRANSLATION_LEVELS
    validate :only_one_socket_present

    def price(currency = nil)
      Price.with_markup cost(currency)
    end

    def cost(currency = nil)
      language.verbal_cost level, currency
    end

    protected
    def only_one_socket_present
      errors[:reserve_socket] << 'only one socket can be presented' if main_socket.present? && reserve_socket.present?
    end
  end
end