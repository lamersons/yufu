I18nDashboard::Engine.load!
I18nDashboard::Engine.redis = TRANSLATION_STORE
I18nDashboard.configure do |config|
  config.authentication_method = :authenticate_and_authorize_i18n!
end
# module I18nDashboard
#   class TranslationsController < ::I18nDashboard::ApplicationController
#     def index
#       @translations = TRANSLATION_STORE.keys
#     end
#   end
# end