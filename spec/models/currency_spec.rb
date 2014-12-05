require 'rails_helper'

RSpec.describe Currency, :type => :model do
  let(:currency) {create :currency}

  describe '#exchange' do
    it {expect(currency.exchange(100)).to eq(100 * currency.rate)}
  end

  describe 'exist only one default currency' do
    let(:old_default) {create :currency, default: true}
    subject{currency.update default: true}
    it 'sets all defaults currency as no default' do
      expect{subject}.to change{old_default.reload.default}.from(true).to(false)
    end
  end

  describe '.default' do
    subject{Currency.default}
    it 'returns first default currency' do
      default = create :currency, default: true
      expect(subject).to eq(default)
    end

    context 'default currency does not exist' do
      it 'returns new currency' do
        is_expected.not_to be_persisted
        is_expected.to be_a(Currency)
      end
      it 'returns currency with rate 1' do
        expect(subject.rate).to eq(1)
      end
    end
  end

end
