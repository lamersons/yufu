require 'rails_helper'

RSpec.describe Order::Application, :type => :model do
  it "is valid if translator has translator's profile" do
    application = build :order_application, translator: create(:translator)
    expect(application.valid?).to be_truthy
  end
  it "isn't valid if translator has translator's profile" do
    application = build :order_application, translator: create(:user)
    expect(application.valid?).to be_falsey
  end
end
