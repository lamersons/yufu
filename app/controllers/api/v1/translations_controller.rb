module Api
  module V1
    class TranslationsController < ApplicationController
      before_action :authenticate_user!

      respond_to :json

      def index
        @translations = Translation.all params[:target_locale].blank? ? I18n.locale : params[:target_locale]
        respond_with @translations
      end

      def update
        target_locale = params[:translation][:locale]
        I18n.backend.store_translations(target_locale, {params[:id] => params[:translation][:value]}, :escape => false)
        # TODO: need using delayed jobs (sidekiq vs resque)
        I18n::JS.export
        render json: { id: params[:id],  value: params[:translation][:value], original: t(params[:id])}
      end
    end

  end
end