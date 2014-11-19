require 'rails_helper'

RSpec.describe Order::Application, :type => :model do

  specify 'cannot create 2 primary application for one order' do
    order = create :order_base
    order.applications << (create :order_application, status: 'primary')
    application = build :order_application, status: 'primary', order: order
    expect(application.valid?).to be_falsey
  end

  describe '#processed_order' do
    subject do
      application.status = 'primary'
      application.save
    end

    RSpec.shared_examples 'processed order' do
      it 'assigns order with translator' do
        expect{subject}.to change{application.order.reload.assignee}.to (application.translator)
      end
      it "sets order's state as in_progress" do
        expect{subject}.to change{application.order.reload.state}.to('in_progress')
      end
    end

    context 'new application' do
      let(:application) {build :order_application}
      include_examples  'processed order'
    end
    context 'update existed' do
      let(:application) {create :order_application}
      include_examples  'processed order'
    end
  end

end