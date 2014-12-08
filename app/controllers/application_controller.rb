class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :set_locale

  def after_sign_in_path_for(resource)
    unless session[:back_to_order].nil?
      session[:back_to_order]
    else
      resource.need_change_password? ? edit_user_path : super
    end
  end

  def authenticate_and_authorize_i18n!
    authenticate_user unless admin_signed_in?
    authorize! :manage, I18n
  end

  def set_locale
    raise CanCan::AccessDenied if params[:locale].present? &&
        Localization.enabled.where(name: params[:locale]).count < 1
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def default_url_options(options={})
    logger.debug "default_url_options is passed options: #{options.inspect}\n"
    { locale: I18n.locale }
  end

  def current_user
    super || current_admin
  end
end
