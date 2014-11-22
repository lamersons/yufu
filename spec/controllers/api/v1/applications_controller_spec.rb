require 'rails_helper'

RSpec.describe Api::V1::ApplicationsController, :type => :controller do


  let(:user)        {create :translator}
  let(:profile)     {user.profiles.first}
  let(:application) {create :order_application, translator: profile}

  before(:each) do
    request.accept = 'application/json'
    sign_in user
  end

  describe 'GET show' do
    subject{get :show, id: application.to_param, profile_id: profile.to_param}
    it 'assigns requested application as @application' do
      expect{subject}.to change{assigns :application}.to(application)
    end
  end

  describe 'GET index' do
    let(:other_application){create :order_application}
    subject{get :index, id: application.to_param, profile_id: profile.to_param}
    before(:each) {other_application}
    it 'assigns applications of profile as @applications' do
      expect{subject}.to change{assigns :applications}.to([application])
    end
    it 'does not return applications of other users' do
      subject
      expect(assigns :applications).not_to include(other_application)
    end
  end

  RSpec.shared_examples 'processed order' do
    it 'sets order state as in_progress' do
      expect{subject}.to change{order.reload.in_progress?}.to(true)
    end

    it 'assigns order with profile' do
      expect{subject}.to change{order.reload.assignee}.to(profile)
    end
  end

  RSpec.shared_examples 'does not processed order' do
    it 'does not change order state' do
      expect{subject}.not_to change{order.reload.in_progress?}
    end

    it 'oes not change order assignee' do
      expect{subject}.not_to change{order.reload.assignee}
    end
  end

  describe 'POST create' do
    subject{post :create, application: attributes, profile_id: profile.to_param}
    let(:order){create :order_base, state: :wait_application}

    RSpec.shared_examples 'creates application' do
      it 'creates new Order::Application' do
        expect{subject}.to change{Order::Application.count}.by(1)
      end
      it 'adds application to order' do
        expect{subject}.to change{order.reload.applications.count}.by(1)
      end
    end

    context 'status is primary' do
      let(:attributes) {{status: 'primary', order_id: order.id}}

      include_examples 'creates application'
      include_examples 'processed order'
    end

    context 'status is secondary' do
      let(:attributes) {{status: 'secondary', order_id: order.id}}

      include_examples 'creates application'
      include_examples 'does not processed order'
    end
  end

  describe 'PUT update' do
    it 'updates only status' do
      expect{
        put :update, id: application.to_param, application: {order_id: (create(:order_base).id)}, profile_id: profile.to_param
      }.not_to change{application.reload.order}
    end
    subject{put :update, id: application.to_param, application: attributes, profile_id: profile.to_param}
    let(:order)  { application.order }
    context 'status is primary' do
      let(:attributes) {{status: 'primary'}}

      include_examples 'processed order'
    end

    context 'status is secondary' do
      let(:attributes) {{status: 'secondary'}}

      include_examples 'does not processed order'
    end
  end

end

