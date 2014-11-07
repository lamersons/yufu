module Api
  module V1
    class ServiceCategoriesController < ApplicationController
      respond_to :json
      def index
        @service_categories = Direction.all
        respond_with @service_categories
      end

      def show
        @service_category = Direction.find params[:id]
        respond_with @service_category
      end
    end
  end
end
