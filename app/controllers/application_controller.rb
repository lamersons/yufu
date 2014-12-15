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

  def set_locale
    if params[:locale].present?
      localization = Localization.where(name: params[:locale]).first
      raise CanCan::AccessDenied if localization.nil?
      authorize! :read, localization
    end
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def default_url_options(options={})
    logger.debug "default_url_options is passed options: #{options.inspect}\n"
    { locale: I18n.locale }
  end

  def current_user
    super || current_admin
  end

  def current_ability
    if current_admin.present?
      @current_ability ||= Ability.new current_admin
    else
      @current_ability ||= Ability.new current_user
    end
  end
end
