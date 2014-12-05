require 'rails_helper'

RSpec.describe Order::Verbal, :type => :model do
  include_context 'default currency'

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
    let (:date_one) {new :reservation_date, date: '01.02.2014'}
    let(:order) do
      order = create :order_verbal, language_criterions_attributes: [{language: language_one},{language: language_two}]
      # order.reservation_dates.first.destroy
      order.language_criterions.first.destroy
      order.reservation_dates.build date: '01.02.2014'
      order.reservation_dates.build date: '02.02.2014'
      order.save!
      order
    end

    it 'expect to link criteria an dates' do
      expect(order.reservation_dates.count).to eq(4)
    end

    it 'expect dates without criterion' do
      count = 0
      order.reservation_dates.each do |date|
        if date.order_language_criterion_id.nil?
          count += 1
        end
      end
      expect(count).to eq(0)
    end

    it '#different' do
      expect(order.different_dates.count).to eq(2)
    end
  end

  describe 'remove reservation date' do
    let(:order) {create :order_verbal, reservation_dates: [(build :order_reservation_date), (build :order_reservation_date)]}
    let(:first_date) {order.reservation_dates.first}
    let(:last_date)  {order.reservation_dates.last}
    subject{order.update_attributes reservation_dates_attributes: [{id: first_date.id.to_s, _destroy: true}, {id: last_date.id.to_s, hours: 12}]}

    it 'removes one dates' do
      expect{subject}.to change{order.reload.reservation_dates.count}.by(-1)
    end
    it 'updates second dates' do
      expect{subject}.to change{last_date.reload.hours}.to(12)
    end
  end

end