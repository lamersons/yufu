require 'rails_helper'

RSpec.describe Api::V1::PartnersClientsController, :type => :controller do

  let(:user)    {create :partner}
  let(:profile) {user.profiles.first}
  let(:partners_client) {create :partners_client, profile_partner: profile}

  before(:each) do
    request.accept = 'application/json'
    sign_in user
  end

  describe 'GET show' do
    subject{get :show, id: partners_client.to_param, profile_id: profile.to_param}
    it 'assigns requested partners_client as @partners_client' do
      expect{subject}.to change{assigns :partners_client}.to(partners_client)
    end
  end

  describe 'GET index' do
    let(:other_partners_client){create :partners_client}
    subject{get :index, id: partners_client.to_param, profile_id: profile.to_param}
    before(:each) {partners_client && other_partners_client}
    it 'assigns partners_clients of current_user as @partners_clients' do
      expect{subject}.to change{assigns :partners_clients}.to([partners_client])
    end
    it 'does not return partners_clients of other users' do
      subject
      expect(assigns :partners_clients).not_to include(other_partners_client)
    end
  end

  describe 'POST create' do
    let(:attributes) { {first_name: 'fff', last_name: 'zzz'} }
    subject{post :create, partners_client: attributes, profile_id: profile.to_param}

    it 'creates new partners_client' do
      expect{subject}.to change{PartnersClient.count}.by(1)
    end
    it 'assigns new partners_client as @partners_client' do
      subject
      expect(assigns :partners_client).to be_a(PartnersClient)
      expect(assigns :partners_client).to be_persisted
    end
    it 'assigns new partners_client to current_user' do
      expect{subject}.to change{profile.reload.clients.count}.by(1)
    end
  end

  describe 'PUT update' do
    let(:attributes) { {first_name: 'fff', last_name: 'ZZZ'} }
    subject{put :update, id: partners_client.to_param, partners_client: attributes, profile_id: profile.to_param}

    it 'updates first_name' do
      expect{subject}.to change{partners_client.reload.first_name}.to('fff')
    end
  end
end
