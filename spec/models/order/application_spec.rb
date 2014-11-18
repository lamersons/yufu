require 'rails_helper'

RSpec.describe Order::Application, :type => :model do

  specify 'cannot create 2 primary application for one order' do
    order = create :order_base
    order.applications << (create :order_application, status: 'primary')
    application = build :order_application, status: 'primary', order: order
    expect(application.valid?).to be_falsey
  end

end