module Api
  module V1
    class LocalizationsController < ApplicationController
      respond_to :json
      def index
        @localizations = Localization.enabled.merge(Localization.search(params[:q]).result)
        respond_with @localizations
      end

      def show
        @localization = Localization.find params[:id]
        respond_with @localization
      end
    end
  end
end
