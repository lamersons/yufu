require 'rails_helper'

RSpec.describe Api::V1::DirectionsController, :type => :controller do

  before(:each) {request.accept = 'application/json'}

  let(:direction) {create :direction}

  describe 'GET index' do
    before(:each){direction}
    it 'returns http success' do
      get :index
      expect(response).to be_success
    end
    it 'assigns all directions as @directions' do
      get :index
      expect(assigns(:directions)).to eq([direction])
    end
  end

  describe 'GET show' do
    it 'returns http success' do
      get :show, id: direction.to_param
      expect(response).to be_success
    end
    it 'assigns direction as @direction' do
      get :show, id: direction.to_param
      expect(assigns(:direction)).to eq(direction)
    end
  end

end
