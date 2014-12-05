require 'rails_helper'

RSpec.describe Price::Base, :type => :model do
  include_context 'default currency'

  let(:price) {build :price_base}
  describe '#cost' do
    context 'with currency' do
      let(:currency) {create :currency, rate: 10}

      it 'returns cost in specify currency' do
        expect(price.cost currency).to eq(currency.exchange(price.value))
      end
    end
    context 'without currency' do
      it 'returns cost in default currency' do
        expect(price.cost).to eq(default_currency.exchange(price.value))
      end
    end
  end
end
