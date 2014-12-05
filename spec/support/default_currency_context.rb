RSpec.shared_context 'default currency' do
  let(:default_currency) {create :currency, default: true}
  before(:each) {default_currency}
end