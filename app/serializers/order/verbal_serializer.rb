class Order::VerbalSerializer < Order::BaseSerializer
  attributes :id, :include_near_city, :goal, :translator_sex, :location_name, :reservation_dates_count
  has_one :main_language_criterion
  has_many :reserve_language_criterions
  has_one :reservation_dates

  def reservation_dates_count
    object.reservation_dates.count
  end
end
