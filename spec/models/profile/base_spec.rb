require 'rails_helper'

RSpec.describe Profile::Base, :type => :model do
  describe '#update' do
    let(:profile) {Profile::Base.create}
    let(:user) {create :user, profiles: [profile]}

    it 'updates delegated attributes' do
      expect{profile.update first_name: 'name'}.to change{user.reload.first_name}.to('name')
    end
  end

end