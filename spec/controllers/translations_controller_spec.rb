require 'rails_helper'

RSpec.describe TranslationsController, :type => :controller do

  describe "GET update" do
    it "returns http success" do
      get :update
      expect(response).to be_success
    end
  end

end
