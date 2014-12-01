require 'rails_helper'

RSpec.describe User, :type => :model do
  describe '#translator?' do
    subject {user.translator?}
    context 'user has profile translator individual' do
      let(:user) {create :user, profiles: [build(:profile_translator_individual)]}
      it {should be_truthy}
    end
    context 'user has profile translator company' do
      let(:user) {create :user, profiles: [build(:translator_company)]}
      it {should be_truthy}
    end
    context 'user has not profile translator' do
      let(:user) {create :user, profiles: []}
      it {should be_falsey}
    end
  end

  describe '#client?' do
    subject {user.client?}
    context 'user has profile client' do
      let(:user) {create :user, profiles: [build(:profile_client)]}
      it {should be_truthy}
    end
    context 'user has not profile client' do
      let(:user) {create :user, profiles: []}
      it {should be_falsey}
    end
  end

  describe '#partner?' do
    subject {user.partner?}
    context 'user has profile partner' do
      let(:user) {create :user, profiles: [build(:profile_partner)]}
      it {should be_truthy}
    end
    context 'user has not profile partner' do
      let(:user) {create :user, profiles: []}
      it {should be_falsey}
    end
  end
end
