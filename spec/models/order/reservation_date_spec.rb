require 'rails_helper'

RSpec.describe Order::ReservationDate, :type => :model do

  describe '#available?' do
    let(:translator) {create :profile_translator_individual}
    let(:reservation_date) do
      language = translator.services.first.language
      lvl = translator.services.first.level
      cr = create :order_language_criterion, language: language, level: lvl
      build :order_reservation_date, order_language_criterion: cr
    end

    before(:each) {translator}

    context 'not pass arguments' do
      context 'there is translator who support lvl and language set for reservation_date' do
        subject{reservation_date.available?}
        it{is_expected.to be_truthy}
      end

      context 'there is no translator who support lvl and language set for reservation_date' do
        subject{build(:order_reservation_date).available?}
        it{is_expected.to be_falsey}
      end
    end

    context 'pass arguments' do
      let(:reservation_date) {build :order_reservation_date}
      subject{reservation_date.available? language, level}
      context 'there is translator who support passed lvl and language' do
        let(:language) {translator.services.first.language}
        let(:level) {translator.services.first.level}

        it{is_expected.to be_truthy}
      end

      context 'there is no translator who support passed lvl and language' do
        let(:language) {create :language}
        let(:level) {'guide'}

        it{is_expected.to be_falsey}
      end
    end

  end

  describe '#available_level' do
    subject{reservation_date.available_level}
    context 'current level is available' do
      let(:translator) {create :profile_translator_individual}
      let(:reservation_date) do
        language = translator.services.first.language
        lvl = translator.services.first.level
        cr = create :order_language_criterion, language: language, level: lvl
        build :order_reservation_date, order_language_criterion: cr
      end
      it 'returns current level for reservation_date' do
        is_expected.to eq(reservation_date.order_language_criterion.level)
      end
    end
    context 'current level is not available' do
      let(:translator) {create :profile_translator_individual }
      let(:translator_guide) {create :profile_translator_individual,
                                     services: [(build :service,
                                                       language: translator.services.first.language, level: 'guide')]}

      let(:reservation_date) do
        translator_guide
        language = translator.services.first.language
        lvl = 'business'
        cr = create :order_language_criterion, language: language, level: lvl
        build :order_reservation_date, order_language_criterion: cr
      end

      it 'returns max available level' do
        is_expected.to eq('expert')
      end
    end
  end

  describe '#cost' do
    let(:default_currency) {create :currency, default: true}
    let(:reservation_date) {order.reservation_dates.first}
    before(:each) {default_currency}

    subject{reservation_date.cost}

    RSpec.shared_examples 'checkers' do
      it {should == expected}
      it {should be_a Numeric}
    end

    context 'hours <= 8' do
      let(:order) {create :order_verbal, reservation_dates: [build(:order_reservation_date)]}
      let(:expected) {reservation_date.order_language_criterion.cost * reservation_date.hours}

      include_examples 'checkers'
    end

    context 'hours > 8' do
      let(:order) {create :order_verbal, reservation_dates: [build(:order_reservation_date, hours: 10)]}
      let(:expected) {reservation_date.order_language_criterion.cost * 8 + 2 * 1.5 * reservation_date.order_language_criterion.cost}

      include_examples 'checkers'
    end

  end

  describe 'validates a pair of date and order_id' do
    let(:order) {create :order_verbal, reservation_dates: [build(:order_reservation_date, date: Date.parse('01.01.2015'))]}
    let(:new_order) {create :order_verbal, reservation_dates: [build(:order_reservation_date, date: Date.parse('10.10.2015'))]}
    it 'correct date' do
      new_date = build :order_reservation_date, order_verbal: order, date: Date.parse('02.01.2015')
      expect(new_date.valid?).to be_truthy
    end

    it 'incorrect date' do
      new_date = build :order_reservation_date, order_verbal: order, date: Date.parse('01.01.2015')
      expect(new_date.valid?).to be_falsey
    end

  end
end