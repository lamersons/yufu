require 'rails_helper'

RSpec.describe Profile::Translator::Individual, :type => :model do
  describe '#approved?' do
    subject{profile.approved?}
    context 'total approve is true' do
      let(:profile) {create :profile_translator_individual, total_approve: true}
      it {is_expected.to be_truthy}
    end

    context 'at least one service is not approved' do
      let(:profile) {create :profile_translator_individual,
                            services: [(build :service, is_approved: false)],
                            total_approve: false}
      it {is_expected.to be_falsey}
    end
    context 'at least one education is not approved' do
      let(:profile) {create :profile_translator_individual,
                            services: [(build :education, is_approved: false)],
                            total_approve: false}
      it {is_expected.to be_falsey}
    end
  end

  describe 'set total approve before save' do
    let(:profile) {create :profile_translator_individual, total_approve: false}
    it 'sets total approve as true if profile is approved' do
      expect{profile.save}.to change{profile.total_approve}.from(false).to(true)
    end
  end

  describe 'scope supported' do
    let(:city) {create :city}
    let(:translator_in_scope) {create :profile_translator_individual, city: city}
    let(:service) {translator_in_scope.services.first}
    let(:translator_with_other_language) {create :profile_translator_individual, city: city}
    let(:translator_with_other_level) {create :profile_translator_individual, city: city , services: [build(:service, level: 'guide')]}
    let(:translator_from_other_city) {create :profile_translator_individual, services: [build(:service, language: service.language)]}
    let(:translator_from_nerby_city) {create :profile_translator_individual, nearby_cities: [city], services: [build(:service, language: service.language)]}
    let(:service) {translator_in_scope.services.first}

    before(:each) { translator_in_scope; translator_with_other_language; translator_with_other_level;
    translator_from_other_city; translator_from_nerby_city }

    subject{Profile::Translator::Individual.support service.language, city, service.level}

    it{is_expected.to include(translator_in_scope)}
    it{is_expected.to include(translator_from_nerby_city)}
    it{is_expected.not_to include(translator_with_other_language)}
    it{is_expected.not_to include(translator_with_other_level)}
    it{is_expected.not_to include(translator_from_other_city)}
  end


end