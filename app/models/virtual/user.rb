class Virtual::User < ActiveRecord::Base
  belongs_to :domain, class_name: 'Virtual::Domain'

  before_save :encrypt_password, if: :password_changed?

  private
  def encrypt_password
    self.password = Digest::SHA1.new(512).digest password
  end
end
