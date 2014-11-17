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
        expect{subject}.to change{order.in_progress?}.to(true)
      end
    end
    context 'user is not translator' do
      let(:user) {create :user}
      it {expect{subject}.to raise_error(ArgumentError)}
    end
  end
end
