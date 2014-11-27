require 'rails_helper'

RSpec.describe Api::V1::ClientInfosController, :type => :controller do

  let(:user)    {create :partner}
  let(:profile) {user.profiles.first}
  let(:client_info) {create :client_info, profile_partner: profile}

  before(:each) do
    request.accept = 'application/json'
    sign_in user
  end

  describe 'GET show' do
    subject{get :show, id: client_info.to_param, profile_id: profile.to_param}
    it 'assigns requested client_info as @client_info' do
      expect{subject}.to change{assigns :client_info}.to(client_info)
    end
  end

  describe 'GET index' do
    let(:other_client_info){create :client_info}
    subject{get :index, id: client_info.to_param, profile_id: profile.to_param}
    before(:each) {client_info && other_client_info}
    it 'assigns client_infos of current_user as @client_infos' do
      expect{subject}.to change{assigns :client_infos}.to([client_info])
    end
    it 'does not return client_infos of other users' do
      subject
      expect(assigns :client_infos).not_to include(other_client_info)
    end
  end

  describe 'POST create' do
    let(:attributes) { {first_name: 'fff', last_name: 'zzz'} }
    subject{post :create, client_info: attributes, profile_id: profile.to_param}

    it 'creates new client_info' do
      expect{subject}.to change{Order::ClientInfo.count}.by(1)
    end
    it 'assigns new client_info as @client_info' do
      subject
      expect(assigns :client_info).to be_a(Order::ClientInfo)
      expect(assigns :client_info).to be_persisted
    end
    it 'assigns new client_info to current_user' do
      expect{subject}.to change{profile.reload.clients.count}.by(1)
    end
  end

  describe 'PUT update' do
    let(:attributes) { {first_name: 'fff', last_name: 'ZZZ'} }
    subject{put :update, id: client_info.to_param, client_info: attributes, profile_id: profile.to_param}

    it 'updates first_name' do
      expect{subject}.to change{client_info.reload.first_name}.to('fff')
    end
  end
end
