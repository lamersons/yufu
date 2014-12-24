require 'rails_helper'

RSpec.describe Api::V1::LanguagesController, :type => :controller do
  
  before(:each) {request.accept = 'application/json'}

  let(:language) {create :language}

  describe 'GET index' do
    before(:each) do
      Language.all.delete
      language
    end
    it 'returns http success' do
      get :index
      expect(response).to be_success
    end
    it 'assigns all languages as @languages' do
      get :index
      expect(assigns(:languages)).to eq([language])
    end
  end

  describe 'GET show' do
    it 'returns http success' do
      get :show, id: language.to_param
      expect(response).to be_success
    end
    it 'assigns language as language' do
      get :show, id: language.to_param
      expect(assigns(:language)).to eq(language)
    end
  end

end
