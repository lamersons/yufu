require 'rails_helper'

RSpec.describe Order::Base, :type => :model do
  describe '#assined_to' do
    let(:order) {create :order_base, state: :wait_application}
    subject{order.assigned_to user.profiles.first}

    context 'user is translator' do
      let(:user) {create :translator}
      it 'sets assignee as user' do
        expect{subject}.to change{order.reload.assignee}.to(user.profiles.first)
      end
      it 'sets state as :in_progress' do
        expect{subject}.to change{order.reload.in_progress?}.to(true)
      end
    end
    context 'user is not translator' do
      let(:user) {create :user}
      it {expect{subject}.to raise_error(ArgumentError)}
    end
  end

  describe '#can_send_primary_application?' do
    it 'returns true if order has not primary application' do
      order = create :order_verbal
      expect(order.can_send_primary_application?).to be_truthy
    end
    it 'returns false if order has primary application' do
      order = create :order_verbal
      order.applications << (create :order_application, status: 'primary')
      expect(order.can_send_primary_application?).to be_falsey
    end
  end

  describe '#reject' do
    let(:order) {create :order_base, assignee: (create :profile_translator_individual), state: :in_progress}
    subject{order.reject}
    it 'sets state as wait_application' do
      expect{subject}.to change{order.reload.wait_application?}.to(true)
    end
    it 'sets assignee as nil' do
      expect{subject}.to change{order.reload.assignee}.to(nil)
    end
  end
end
