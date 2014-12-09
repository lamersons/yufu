module Api
  module V1
    class TranslationsController < ApplicationController
      before_action :authenticate_user!

      def index
        @translations = I18nDashboard::Translation.all
        original_locale = params[:original_locale].blank? ? I18n.locale : params[:original_locale]
        respond_to do |formats|
          formats.json do
            objects = []
            @translations.each do |tr|
              objects << {id: tr, value: t(tr, default: ''), original: t(tr, locale: original_locale) }
            end
            render json: {translations: objects}
          end
        end
      end
    end
  end
end