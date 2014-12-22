class Virtual::User < ActiveRecord::Base
  belongs_to :domain, class_name: 'Virtual::Domain'

  validates_presence_of :password, :domain

  before_save :encrypt_password, if: -> { password.present? && password_changed?}
  after_initialize :set_default_domain, if: -> {domain.nil?}

  private
  def encrypt_password
    self.password = password.crypt '$6$'
  end

  def set_default_domain
    self.domain = Virtual::Domain.where(name: 'yufu.net').first
    true
  end
end
