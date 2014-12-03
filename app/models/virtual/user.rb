class Virtual::User < ActiveRecord::Base
  belongs_to :domain, class_name: 'Virtual::Domain'

  before_save :encrypt_password, if: :password_changed?

  private
  def encrypt_password
    self.password = password.crypt '$6$'
  end
end
