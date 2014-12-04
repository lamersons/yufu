FactoryGirl.define do
  factory :order_reservation_date, :class => 'Order::ReservationDate' do
    date "2014-11-17"
    hours 8
    order_language_criterion { build :order_language_criterion }
  end

end
