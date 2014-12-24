require 'rails_helper'

RSpec.describe Order::Written, type: :model do

  let(:order){create :order_written}

  describe '#cost' do
    let(:expected_cost) do
      (order.translation_languages.inject (0) {|sum, l| sum + l.written_cost(order.translation_type)}) * order.words_number
    end

    context 'pass level' do
      let(:level) {'translate'}
      subject{order.cost nil, level}
      it {is_expected.to eq(expected_cost)}
      it {is_expected.not_to eq(Float::INFINITY)}
    end

    context 'without pass arguments' do
      let(:level) {order.level}
      subject{order.cost}
      it {is_expected.to eq(expected_cost)}
      it {is_expected.not_to eq(Float::INFINITY)}
    end
  end

  describe '#price' do
    it 'returns cost with markup' do
      expect{order.price}.to eq(Price.with_markup order.cost)
    end
  end

end