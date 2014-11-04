require 'rails_helper'

RSpec.describe Api::V1::UsersController, :type => :controller do

  before(:each) {request.accept = 'application/json'}

  let(:user) {create :user}

  describe 'POST create' do
    include EmailSpec::Helpers
    include EmailSpec::Matchers

    let(:attr) { {email: 'user@example.com'} }

    subject{post :create, user: attr}

    it 'creates new user' do
      expect{subject}.to change{User.count}.by(1)
    end
    it 'should deliver the signup email' do
      subject
      email = UsersMailer.create(assigns(:user))
      expect(email).to deliver_to('user@example.com')
    end
  end

  describe "GET show" do
    it 'returns http success' do
      get :show, id: user.to_param
      expect(response).to be_success
    end
    it 'assigns user as user' do
      get :show, id: user.to_param
      expect(assigns(:user)).to eq(user)
    end
  end

  describe "GET index" do
    before(:each){user}
    it 'returns http success' do
      get :index
      expect(response).to be_success
    end
    it 'assigns all users as @users' do
      get :index
      expect(assigns(:users)).to eq([user])
    end
  end

  describe "POST update" do
    subject{put :update, id: user.to_param, user: attrs}

    it_behaves_like 'protected action'

    context 'I am user' do
      include_context 'signed in as user'

      context 'valid data' do
        let(:attrs){ {email: 'email@example.com'} }

        it 'returns http success' do
          subject
          expect(response).to be_success
        end

        it {expect{subject}.to change{user.reload.email}.to('email@example.com')}
      end

      context 'invalid data' do
        let(:attrs){ {email: 'fake'} }
        it 'returns http fails' do
          subject
          expect(response).not_to be_success
        end
      end
    end
  end

end
