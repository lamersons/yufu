require 'rails_helper'
RSpec.describe OrderCleanerWorker, :type => :worker do
  let(:order_for_destroy) {create :order_verbal, state: 'new', owner: nil, created_at: Date.yesterday}
  let(:order_with_owner) {create :order_verbal, state: 'new', created_at: Date.yesterday}
  let(:fresh_owner) {create :order_verbal, state: 'new', owner: nil}

  describe '#perform' do

    before(:each) { order_for_destroy && order_with_owner && fresh_owner }

    subject { OrderCleanerWorker.new.perform }

    it { expect{subject}.to change{Order::Base.count}.by(-1)}

    it 'destroy all orders without owner, with state new and older than 1 day ' do
      subject
      expect(Order::Base.all).to_not include(order_for_destroy)
    end

    it 'does not destroy orders with owner' do
      subject
      expect(Order::Base.all).to include(order_with_owner)
    end

    it 'does not destroy fresh orders' do
      subject
      expect(Order::Base.all).to include(fresh_owner)
    end
  end

end
