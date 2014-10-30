RSpec.shared_context 'signed in as user' do
  let(:user) {FactoryGirl.create :user}
  before(:each) {sign_in user}
end