require 'rails_helper'

RSpec.describe Message, :type => :model do
  it_behaves_like 'notifier' do
    let(:recipients) {[create(:user)]}
    subject {create :message, recipient: recipients.first}
  end

  describe 'after save' do
    let(:recipient) {create :user, duplicate_messages_on_email: true}
    it 'should send email to user' do
      expect{
        Message.create sender: create(:user), recipient: recipient, body: 'hi'
      }.to change {ActionMailer::Base.deliveries.count}.by(1)
    end
  end
end
