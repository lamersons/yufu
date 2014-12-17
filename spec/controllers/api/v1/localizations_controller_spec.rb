require 'rails_helper'

RSpec.describe Api::V1::LocalizationsController, :type => :controller do
  
  before(:each) {request.accept = 'application/json'}

  let(:localization) {Localization.first}

  describe 'GET index' do
    before(:each){localization}
    it 'returns http success' do
      get :index
      expect(response).to be_success
    end
    it 'assigns all localizations as @localizations' do
      get :index
      expect(assigns(:localizations)).to eq(Localization.enabled)
    end
  end

  describe 'GET show' do
    it 'returns http success' do
      get :show, id: localization.to_param
      expect(response).to be_success
    end
    it 'assigns localization as localization' do
      get :show, id: localization.to_param
      expect(assigns(:localization)).to eq(localization)
    end
  end

end
