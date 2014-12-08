module Api
  module V1
    class TranslationsController < ApplicationController
      before_action :authenticate_user!

      def index
        @translations = I18nDashboard::Translation.all
        respond_to do |formats|
          formats.json do
            objects = []
            @translations.each { |tr| objects << {id: tr}}
            render json: {translations: objects}
          end
        end
      end
    end
  end
end