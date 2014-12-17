require 'rails_helper'

RSpec.describe LanguagesGroup, :type => :model do
  let(:languages_group) { create :languages_group }
  include_context 'default currency'
  describe '#verbal_cost' do
    context 'price with requested level exist' do
      it {expect(languages_group.verbal_cost('guide')).to eq(languages_group.verbal_prices.first.cost)}
    end
    context "price with requested level doesn't exist" do
      it {expect(languages_group.verbal_cost('fake')).to eq(Float::INFINITY)}
    end
  end
end
