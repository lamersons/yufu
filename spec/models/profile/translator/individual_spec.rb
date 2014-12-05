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
    let(:profile) {build :profile_translator_individual, total_approve: false}
    it 'sets total approve as true if profile is approved' do
      expect{profile.save}.to change{profile.total_approve}.from(false).to(true)
    end
  end
end