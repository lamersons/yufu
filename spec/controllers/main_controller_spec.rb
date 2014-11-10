require 'rails_helper'

RSpec.describe MainController, :type => :controller do

  describe 'GET index' do
    it 'returns http success' do
      get :index
      expect(response).to be_success
    end
    it 'assigns user' do
      get :index
      expect(assigns(:user).class).to eq(User)
    end

  end


end