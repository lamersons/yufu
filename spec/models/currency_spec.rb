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
    it 'returns first default currency' do
      default = create :currency, default: true
      expect(Currency.default).to eq(default)
    end
  end

end
