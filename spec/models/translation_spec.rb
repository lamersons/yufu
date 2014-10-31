require 'rails_helper'

RSpec.describe Translation, :type => :model do
  describe '.[]' do
    let(:translation) {create :translation}
    before(:each) do
      create :translation
      create :translation
    end
    subject{Translation[translation.key]}
    it 'returns value by key' do
      expect(subject).to eq(translation.value)
    end
  end
end
