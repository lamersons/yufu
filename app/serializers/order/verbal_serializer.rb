class Order::VerbalSerializer < Order::BaseSerializer
  attributes :id, :include_near_city, :goal, :translator_sex
  has_one :language_criterions
  has_one :reservation_dates
end
