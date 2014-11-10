class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def authenticate_and_authorize_i18n!
    authenticate_user!
    authorize! :manage, :i18n
  end
end
