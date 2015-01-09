module Notificable
  extend ActiveSupport::Concern

  included do
    @@users_scope = User.all
    @@message = ''
  end

  def notify
    send_notification(@@message)
  end

  def send_notification(msg)
    if @@users_scope.is_a?(Symbol) || @@users_scope.is_a?(String)
      scope = self.send(@@users_scope)
    else
      scope = @@users_scope
    end
    if scope.is_a? User
      scope.notifications.create message: msg, object: self
    else
      scope.each {|u| u.notifications.create message: msg, object: self}
    end
  end

  module ClassMethods
    def acts_as_notificable(options ={})
      self.class_variable_set :@@users_scope, options[:users_scope] unless options[:users_scope].nil?
      self.class_variable_set :@@message,     options[:message] unless options[:message].nil?
    end
  end
end