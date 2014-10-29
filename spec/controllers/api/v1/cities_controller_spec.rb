require 'rails_helper'

RSpec.describe Api::V1::CitiesController, :type => :controller do
  before(:each) {request.accept = 'application/json'}

  let(:city) {create :city}

  describe 'GET index' do
    before(:each){city}
    it 'returns http success' do
      get :index
      expect(response).to be_success
    end
    it 'assigns all cities as @cities' do
      get :index
      expect(assigns(:cities)).to eq([city])
    end
  end

  describe 'GET show' do
    it 'returns http success' do
      get :show, id: city.to_param
      expect(response).to be_success
    end
    it 'assigns city as city' do
      get :show, id: city.to_param
      expect(assigns(:city)).to eq(city)
    end
  end

end
