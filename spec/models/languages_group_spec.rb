require 'rails_helper'

RSpec.describe LanguagesGroup, :type => :model do
  let(:languages_group) { create :languages_group }
  let(:default_currency) {create :currency, default: true}
  before(:each) {default_currency}
  describe '#verbal_cost' do
    context 'price with requested level exist' do
      it {expect(languages_group.verbal_cost(1)).not_to be_nil}
    end
    context "price with requested level doesn't exist" do
      it {expect(languages_group.verbal_cost(10)).to be_nil}
    end
  end
end
