require 'rails_helper'

RSpec.describe Message, :type => :model do
  describe '.keys' do
    subject{Translation.keys}
    it {is_expected.not_to be_empty}
  end
end
