require 'rails_helper'

RSpec.describe Api::V1::ProfilesController, :type => :controller do

  before(:each) do
    @user = create :user
    @user.profiles << Profile::Client.new
    @user.save
  end

  describe '#show' do

    subject{get :show, {user_id: @user.id, id: @user.profiles.first.id}}

    it 'should show profile' do
      subject
      expect(assigns(:profile).class).to eq(Profile::Client)
    end
  end

  describe '#index' do

    before(:each) do
      @user.profiles << Profile::Translator::Base.new
      @user.save
      user_two = create :user
      user_two.profiles << Profile::Client.new
      user_two.save
    end
    subject{get :index, {user_id: @user.id}}

    it 'should show list' do
      subject
      expect(assigns(:profiles).count).to eq(3)
    end
  end

  describe '#create' do
    before(:each){sign_in @user}

    let(:valid_attr){{ profile: {type: 'Profile::Translator::Individual', sex: 'male', visa: '123'}}}
    let(:invalid_attr){{ profile: {type: 'Profile::Client', sex: 'male', visa: '123'}}}

    describe 'correct data' do
      subject{post :create, valid_attr}

      it 'should be success' do
        subject
        expect(response.body).to eq({success: true}.to_json)
      end

      it 'should create' do
        subject
        expect(@user.reload.profiles.last.class).to eq(Profile::Translator::Individual)
      end

      it 'correct data' do
        subject
        expect(@user.reload.profiles.last.sex).to eq('male')
        expect(@user.reload.profiles.last.visa).to eq('123')
      end
    end

    describe 'incorrect data' do
      subject{post :create, invalid_attr}
      it 'should not be success' do
        subject
        expect(response.body).to eq({success: false}.to_json)
      end
    end
  end

  describe '#update' do

    before(:each){sign_in @user}

    describe 'valid data' do
      subject{put :update, user_id: @user.id, id: @user.profiles.last.id, profile:{ company_uid: 'Nimfa'}}
      it 'should be success' do
        subject
        expect(response.body).to eq({success: true}.to_json)
      end

      it 'should be updated' do
        subject
        expect(@user.reload.profiles.last.company_uid).to eq('Nimfa')
      end
    end

    describe 'invalid date' do
      subject{put :update, user_id: @user.id, id: @user.profiles.last.id, profile:{company_name: 'Nimfa', feedback: 'does not give goods throw it to the swing'}}
      it 'should not be success' do
        subject
        expect(response.body).to eq({success: false}.to_json)
      end
    end
  end

end