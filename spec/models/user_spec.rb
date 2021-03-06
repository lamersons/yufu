require 'rails_helper'

RSpec.describe User, :type => :model do
  describe '#translator?' do
    subject {user.translator?}
    context 'user has profile translator individual' do
      let(:user) {create :user, profiles: [build(:profile_translator_individual)]}
      it {is_expected.to be_truthy}
    end
    context 'user has profile translator company' do
      let(:user) {create :user, profiles: [build(:translator_company)]}
      it {is_expected.to be_truthy}
    end
    context 'user has not profile translator' do
      let(:user) {create :user, profiles: []}
      it {is_expected.to be_falsey}
    end
    context 'user has not approved profile' do
      let(:user) {create :user, profiles: [build(:translator_company, total_approve: false)]}
      it {is_expected.to be_falsey}
    end
  end

  describe '#client?' do
    subject {user.client?}
    context 'user has profile client' do
      let(:user) {create :user, profiles: [build(:profile_client)]}
      it {is_expected.to be_truthy}
    end
    context 'user has not profile client' do
      let(:user) {create :user, profiles: []}
      it {is_expected.to be_falsey}
    end
  end

  describe '#partner?' do
    subject {user.partner?}
    context 'user has profile partner' do
      let(:user) {create :user, profiles: [build(:profile_partner)]}
      it {is_expected.to be_truthy}
    end
    context 'user has not profile partner' do
      let(:user) {create :user, profiles: []}
      it {is_expected.to be_falsey}
    end
  end

  describe 'update password'  do
    let(:user) {User.first}

    before(:each) {create :user, password: 'password'}

    subject {user.password = new_password}

    context 'new password equals old' do
      let(:new_password) {'password'}
      it {expect{subject}.to change{user.valid?}.from(true).to(false)}
    end

    context 'new password equals old' do
      let(:new_password) {'new_password'}
      it {expect{subject}.not_to change{user.valid?}}
    end
  end
end
