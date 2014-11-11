class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def after_sign_in_path_for(resource)
    resource.sign_in_count == 1 ?  edit_user_password_path : super
  end

  def authenticate_and_authorize_i18n!
    authenticate_user!
    authorize! :manage, :i18n
  end
end
