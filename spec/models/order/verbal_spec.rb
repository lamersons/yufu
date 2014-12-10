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
    let(:order) do
      create :order_verbal, language_criterions: [(build :order_language_criterion, {language: (build :language, name: 'Rus')}),
                                                  (build :order_language_criterion,{language: (build :language, name: 'Eng')})],
                     reservation_dates: [(build :order_reservation_date, date: '01.02.2014', order_language_criterion: nil),
                                         (build :order_reservation_date, date: '02.02.2014', order_language_criterion: nil)]
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


  describe 'create payment and gateway' do
    let(:order) {create :order_verbal}

    subject{order.update_attribute :pay_way, 'bank'}

    it 'expect to create payment' do
      expect{subject}.to change{order.payments.last.class}.to eq(Order::Payment)
    end


    it 'expect to create payment' do
      expect{subject}.to change{order.payments.last.try(:gateway_class)}.to eq('Order::Gateway::Bank')
    end

    it 'expect to change state' do
      expect{subject}.to change{order.state}.from('new').to('paying')
    end
  end

  describe 'change order state' do
    describe 'to paid' do
      let(:order) {create :order_verbal, pay_way: 'bank'}

      subject{order.payments.first.update_attribute :state, 'paid'}

      it 'expect order to be paid' do
        expect{subject}.to change{order.state}.to('wait_application')
      end
    end
    describe 'to unpaid' do
      let(:order) {create :order_verbal, pay_way: 'bank'}

      subject{order.payments.first.update_attribute :state, 'paying'}

      before(:each) do
        order.payments.first.update_attribute :state, 'paid'
      end

      it 'expect order to be paid' do
        order.paid
        expect{subject}.to change{order.state}.to('paying')
      end

      it 'can not change from closed' do
        order.update_attribute :state, 'close'
        subject
        expect(order.state).to eq('close')
      end

      it 'can not change from rated' do
        order.update_attribute :state, 'rated'
        expect(order.state).to eq('rated')
      end

      it 'can not change from in_progress' do
        order.update_attribute :state, 'in_progress'
        expect(order.state).to eq('in_progress')
      end
    end



  end

end