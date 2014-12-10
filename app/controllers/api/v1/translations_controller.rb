module Api
  module V1
    class TranslationsController < ApplicationController
      before_action :authenticate_user!

      def index
        @translations = I18nDashboard::Translation.all
        target_locale = params[:target_locale].blank? ? I18n.locale : params[:target_locale]
        respond_to do |formats|
          formats.json do
            objects = []
            @translations.each do |tr|
              objects << {id: tr, original: t(tr), value: t(tr, locale: target_locale, default: '') }
            end
            render json: {translations: objects}
          end
        end
      end

      def update
        target_locale = params[:translation][:locale]
        I18n.backend.store_translations(target_locale, {params[:id] => params[:translation][:value]}, :escape => false)
        render json: { id: params[:id],  value: params[:translation][:value], original: t(params[:id])}
      end
    end
  end
end