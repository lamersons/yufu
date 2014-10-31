require 'rails_helper'

RSpec.describe Api::V1::ServiceCategoriesController, :type => :controller do

  before(:each) {request.accept = 'application/json'}

  let(:service_category) {create :service_category}

  describe 'GET index' do
    before(:each){service_category}
    it 'returns http success' do
      get :index
      expect(response).to be_success
    end
    it 'assigns all service_categorys as @service_categories' do
      get :index
      expect(assigns(:service_categories)).to eq([service_category])
    end
  end

  describe 'GET show' do
    it 'returns http success' do
      get :show, id: service_category.to_param
      expect(response).to be_success
    end
    it 'assigns service_category as service_category' do
      get :show, id: service_category.to_param
      expect(assigns(:service_category)).to eq(service_category)
    end
  end

end
