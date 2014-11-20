require 'rails_helper'

RSpec.describe BannersController, :type => :controller do

  let(:banner){create :banner}

  describe "GET show" do
    subject{get :show, id: banner.to_param}
    it "returns http success" do
      subject
      expect(response).to be_success
    end
    it 'assigns requested banner as @banner' do
      expect{subject}.to change{assigns :banner}.to(banner)
    end
  end

end
