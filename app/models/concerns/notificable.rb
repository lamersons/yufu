module Notificable
  extend ActiveSupport::Concern

  included do
    cattr_accessor :users_scope
    @@users_scope = User.all
  end

  def send_notification(msg)
    if @@users_scope.is_a? User
      @@users_scope.notifications.create message: msg, object: self
    else
      @@users_scope.each {|u| u.notifications.create message: msg, object: self}
    end
  end

  module ClassMethods
    def acts_as_notificable(options ={})
      @@users_scope = options[:users_scope] unless options[:users_scope].nil?
    end
  end
end