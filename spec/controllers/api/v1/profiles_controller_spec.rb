require 'rails_helper'

RSpec.describe Api::V1::ProfilesController, :type => :controller do
  
  let(:user) {create :client}
  
  before(:each) do
    request.accept = 'application/json'
  end

  describe '#show' do

    subject{get :show, {user_id: user.id, id: user.profiles.first.id}}

    it 'should show profile' do
      subject
      expect(assigns(:profile).class).to eq(Profile::Client)
    end
  end

  describe '#index' do

    before(:each) do
      user.profiles << Profile::Translator::Base.new
      user.save
      sign_in user
      user_two = create :user
      user_two.profiles << Profile::Client.new
      user_two.save
    end
    subject{get :index}

    it 'should show list' do
      subject
      expect(assigns(:profiles).count).to eq(2)
    end

  end

  describe '#create' do
    before(:each){sign_in user}

    let(:valid_attr){{ user_id: user.id, profile: {_type: 'Profile::Translator::Individual', sex: 'male', visa: '123'}}}
    let(:invalid_attr){{ user_id: user.id, profile: {_type: 'Profile::Client', sex: 'male', visa: '123'}}}

    describe 'correct data' do
      subject{post :create, valid_attr}
      it 'should create' do
        subject
        expect(user.reload.profiles.last.class).to eq(Profile::Translator::Individual)
      end

      it 'correct data' do
        subject
        expect(user.reload.profiles.last.sex).to eq('male')
        expect(user.reload.profiles.last.visa).to eq('123')
      end
    end

    describe 'incorrect data' do
      subject{post :create, invalid_attr}
      it 'should not be success' do
        subject
        expect(response.body).to eq({success: false}.to_json)
      end
    end


    describe 'nested_attr' do
      let(:valid_attr){{ user_id: user.id,
                         profile: {type: 'Profile::Translator::Company', employees_attributes: [{sex: 'male', age: 23},{sex: 'female', age: 123}]}}}
      subject{post :create, valid_attr}

      it 'should be correct data' do
        subject
        expect(assigns(:profile).employees.first.age).to eq(23)
        expect(assigns(:profile).employees.last.age).to eq(123)
        expect(assigns(:profile).employees.first.sex).to eq('male')
        expect(assigns(:profile).employees.last.sex).to eq('female')
      end
    end
  end

  describe '#update' do

    before(:each){sign_in user}

    describe 'valid data' do
      subject{put :update, user_id: user.id, id: user.profiles.last.id, profile:{_type: 'Profile::Client', company_uid: 'Nimfa'}}

      it 'should be updated' do
        subject
        expect(user.reload.profiles.last.company_uid).to eq('Nimfa')
      end
    end

  end

end