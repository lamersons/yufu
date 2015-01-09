require 'rails_helper'

RSpec.describe Notificable do
  before :all do
    class ExampleClass
      include Mongoid::Document
      include Notificable
      after_create {send_notification 'hi'}
      acts_as_notificable user_scope: User.all
    end
  end
  let(:user) {create :user}
  subject{ExampleClass.create}

  it 'creates new instance of notification for user' do
    expect{subject}.to change{user.reload.notifications.count}.by(1)
  end
  it 'assigns new notification with object' do
    user
    obj = subject
    expect(user.reload.notifications.last.object).to eq(obj)
  end


end