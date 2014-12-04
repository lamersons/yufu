require 'rails_helper'

RSpec.describe Order::ReservationDate, :type => :model do
  describe '#cost' do
    let(:default_currency) {create :currency, default: true}
    let(:reservation_date) {order.reservation_dates.first}
    before(:each) {default_currency}

    subject{reservation_date.cost}

    RSpec.shared_examples 'checkers' do
      it {should == expected}
      it {should be_a Numeric}
    end

    context 'houre <= 8' do
      let(:order) {create :order_verbal, reservation_dates: [build(:order_reservation_date)]}
      let(:expected) {reservation_date.order_language_criterion.cost * reservation_date.hours}

      include_examples 'checkers'
    end

    context 'houre > 8' do
      let(:order) {create :order_verbal, reservation_dates: [build(:order_reservation_date, hours: 10)]}
      let(:expected) {reservation_date.order_language_criterion.cost * 8 + 2 * 1.5 * reservation_date.order_language_criterion.cost}

      include_examples 'checkers'
    end

  end
end