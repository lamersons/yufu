module Order
  class Verbal < Base

    TRANSLATION_LEVELS = %w(guide business expert)

    GENDERS = ['male', 'female']
    GOALS   = ['business', 'entertainment']
    DEFAULTCOST = 115.0


    field :translation_level
    field :include_near_city, type: Mongoid::Boolean, default: false
    field :goal
    field :translator_sex

    belongs_to :location, class_name: 'City'
    belongs_to :translator_native_language, class_name: 'Language'
    belongs_to :native_language,            class_name: 'Language'


    has_many :reserve_language_criterions,    class_name: 'Order::LanguageCriterion', inverse_of: :reserve_socket
    has_one :main_language_criterion,         class_name: 'Order::LanguageCriterion', inverse_of: :main_socket

    embeds_many :reservation_dates,           class_name: 'Order::ReservationDate'

    accepts_nested_attributes_for :reserve_language_criterions,  allow_destroy: true
    accepts_nested_attributes_for :main_language_criterion
    accepts_nested_attributes_for :reservation_dates,            allow_destroy: true

    has_and_belongs_to_many :directions

    delegate :name, to: :location, prefix: true, allow_nil: true

    before_save :check_dates
    before_save :add_extra_dates
    after_save :check_pay_way
    # TODO: should be removed
    def sum
      reservation_dates.inject(0.0) do |sum, elem|
        sum += elem.cost*(1+(elem.hours-8)*1.5/8)
      end
    end

    def additional_cost(currency = nil)
      10
    end

    def general_cost(currency = nil)
      reservation_dates.to_a.inject(0) { |sum, n| sum + n.cost(currency) }
    end

    def cost_price(currency = nil)
      general_cost(currency) + additional_cost(currency)
    end

    def price(currency = nil)
      Price.with_markup cost_price(currency)
    end

    def different_dates
      dates = []
      reservation_dates.each do |date|
        unless dates.map{|d| d.date}.include? date.date || !date.fake?
          dates << date
        end
      end
      dates
    end

    private

    def add_extra_dates
      reservation_dates.each do |date|
        reservation_dates.create date: {day: date.day+1, year: date.year, month: date.month}
        reservation_dates.create  date: {day: date.day+2, year: date.year, month: date.month}
        reservation_dates.create  date: {day: date.day+3, year: date.year, month: date.month}
        reservation_dates.create  date: {day: date.day-1, year: date.year, month: date.month}
        reservation_dates.create  date: {day: date.day-2, year: date.year, month: date.month}
        reservation_dates.create  date: {day: date.day-3, year: date.year, month: date.month}
      end
    end

    def check_dates
      reservation_dates.each do |date|
        if date.fake?
          date.write_attribute :order_language_criterion_id, main_language_criterion.id
        end
      end
    end


    def check_pay_way
      if pay_way_changed? && !paid? && !pay_way.blank?
        case pay_way
          when 'bank'
            payments.create gateway_class: 'Order::Gateway::Bank'
            PaymentsMailer.bank_payment(owner).deliver
            self.paying
        end
      end
    end
  end
end