module Api
  module V1
    class LanguagesController < ApplicationController
      respond_to :json
      def index
        @languages = Language.all
        respond_with @languages
      end

      def show
        @language = Language.find params[:id]
        respond_with @language
      end
    end
  end
end
