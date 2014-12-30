require 'rails_helper'

RSpec.describe Api::V1::MessagesController, :type => :controller do

  let(:user)      {create :user}
  let(:recipient) {create :user}
  let(:message)   {create :message, sender: user, recipient: recipient}

  before(:each) do
    request.accept = 'application/json'
    message
    sign_in user
  end

  describe 'GET show' do
    subject{get :show, id: message.to_param}
    context 'my message' do
      it 'assigns requested message as @message' do
        expect{subject}.to change{assigns :message}.to(message)
      end
    end
    context 'not my message' do
      let(:message) {create :message}
      it 'access denied' do
        expect{subject}.to raise_error(CanCan::AccessDenied)
      end
    end
  end

  describe 'GET index' do
    let(:inbox_message) {create :message, recipient: user}
    before(:each) {inbox_message}
    subject{get :index, scope}
    context 'scope inbox' do
      let(:scope) {{}}
      it 'assigns inbox messages as @messages' do
        expect{subject}.to change{assigns :messages}.to([inbox_message])
      end
    end

    context 'scope outbox' do
      let(:scope) {{scope: 'outbox'}}
      it 'assigns outbox messages as @messages' do
        expect{subject}.to change{assigns :messages}.to([message])
      end
    end
  end

  describe 'POST create' do
    let(:attributes) { {recipient_id: recipient.id, body: 'hi'} }
    subject{post :create, message: attributes}

    it 'creates new message' do
      expect{subject}.to change{Message.count}.by(1)
    end
    it 'assigns new message as @message' do
      subject
      expect(assigns :message).to be_a(Message)
      expect(assigns :message).to be_persisted
    end
    it 'assigns new message to current_user' do
      expect{subject}.to change{user.reload.outbox.count}.by(1)
    end
  end


end
