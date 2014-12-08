module Api
  module V1
    class LocalizationsController < ApplicationController
      respond_to :json
      def index
        @localizations = Localization.all
        respond_with @localizations
      end

      def show
        @localization = Localization.find params[:id]
        respond_with @localization
      end
    end
  end
end
