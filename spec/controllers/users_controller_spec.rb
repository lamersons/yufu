require 'rails_helper'

RSpec.describe UsersController, :type => :controller do

  let(:user) {create :user}
  before(:each) do
    sign_in user
  end

  describe "GET edit" do
    it "returns http success" do
      get :edit
      expect(response).to be_success
    end
  end

  describe "GET update" do
    subject{ put :update, {user: attr}}

    context 'password equals password_confirmation' do
      let(:attr) { {password: 'new_password', password_confirmation: 'new_password'} }

      it {expect{subject}.to change{user.reload.encrypted_password}}

      it "redirects to user/show" do
        expect(subject).to redirect_to(user_path)
      end
    end

    context 'password and password_confirmation are not equal' do
      let(:attr) { {password: 'new_password', password_confirmation: 'other_password'} }

      it {expect{subject}.not_to change{user.reload.encrypted_password}}

      it "renders edit template and shows errors" do
        expect(subject).to render_template('users/edit')
      end
    end
  end

end
