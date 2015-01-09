RSpec.shared_examples 'notifier' do ||
  describe 'it is notificable' do
    it 'has class variable message' do
      expect(described_class.class_variable_get :@@message).not_to be_blank
    end
    it {expect(described_class.new).to be_a_kind_of(Notificable)}
  end
  describe 'send notification' do
    it 'sends notification to recipients' do
      expect{subject}.to change{
                           recipients.inject (0) { |sum, r| sum + r.reload.notifications.count }
                         }.by(recipients.count)
    end
  end
end