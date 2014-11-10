I18nDashboard::Engine.load!
I18nDashboard.configure do |config|
  config.authentication_method = :authenticate_and_authorize_i18n!
end
