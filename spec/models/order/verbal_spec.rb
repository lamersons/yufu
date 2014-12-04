require 'rails_helper'

RSpec.describe Order::Verbal, :type => :model do
  let(:default_currency) {create :currency, default: true}
  before(:each) {default_currency}

  RSpec.shared_examples 'returns numeric' do
    it 'returns numeric' do
      expect(subject).to be_a(Numeric)
    end
  end

  describe '#general_cost' do
    let(:order) {create :order_verbal}
    subject{order.general_cost}
    it 'returns cost only for reserved dates, without additions' do
      expect(subject).to eq(order.reservation_dates.first.cost)
    end
    include_examples 'returns numeric'
  end

  describe '#cost_price' do
    let(:order) {create :order_verbal}
    subject{order.cost_price}
    it 'returns full cost with additions' do
      expect(subject).to eq(order.general_cost + order.additional_cost)
    end
    include_examples 'returns numeric'
  end

  describe '#price' do
    let(:order) {create :order_verbal}
    subject{order.price}
    it 'returns price of services for clients. include markup' do
      expect(subject).to eq(order.cost_price / 0.7)
    end
    include_examples 'returns numeric'
  end

  describe '#check_dates' do
    let (:language_one) {create :language, name: 'Rus'}
    let (:language_two) {create :language, name: 'Eng'}
    let(:order) {create :order_verbal, {reservation_dates_attributes: [{date: '01.01.2015'},{date: '02.01.2015'}], language_criterions_attributes: [{language: language_one},{language: language_two}]}}

    it 'expect to link criteria an dates' do
      expect(order.reservation_dates.count).to eq(4)
    end
  end

end