require 'rails_helper'

RSpec.describe Api::V1::BannersController, :type => :controller do

  let(:user)   {create :user}
  let(:banner) {create :banner, user: user}

  before(:each) do
    request.accept = 'application/json'
    sign_in user
  end

  describe 'GET show' do
    subject{get :show, id: banner.to_param}
    it 'assigns requested banner as @banner' do
      expect{subject}.to change{assigns :banner}.to(banner)
    end
  end

  describe 'GET index' do
    let(:other_banner){create :banner}
    subject{get :index, id: banner.to_param}
    before(:each) {other_banner}
    it 'assigns banners of current_user as @banners' do
      expect{subject}.to change{assigns :banners}.to([banner])
    end
    it 'does not return banners of other users' do
      subject
      expect(assigns :banners).not_to include(other_banner)
    end
  end

  describe 'POST create' do
    let(:attributes) { {width: 200, height: 300, name: 'name'} }
    subject{post :create, banner: attributes}

    it 'creates new banner' do
      expect{subject}.to change{Banner.count}.by(1)
    end
    it 'assigns new banner as @banner' do
      subject
      expect(assigns :banner).to be_a(Banner)
      expect(assigns :banner).to be_persisted
    end
    it 'assigns new banner to current_user' do
      expect{subject}.to change{user.reload.banners.count}.by(1)
    end
  end

  describe 'PUT update' do
    let(:attributes) { {width: 200} }
    subject{put :update, id: banner.to_param, banner: attributes}

    it 'updates width' do
      expect{subject}.to change{banner.reload.width}.to(200)
    end
  end

end
