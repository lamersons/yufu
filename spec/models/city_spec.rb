require 'rails_helper'

RSpec.describe City, type: :model do
  describe '.with_approved_translators' do
    let(:translator) {create :translator}
    let(:city_with_approved_translator) { translator.profiles.first.city}
    let(:city_without_translators) {create :city}

    before(:each) {translator && city_without_translators}

    subject {City.with_approved_translators}

    it { is_expected.to     include(city_with_approved_translator) }
    it { is_expected.not_to include(city_without_translators) }
  end
end