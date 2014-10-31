module Api
  module V1
    class ServiceCategoriesController < ApplicationController
      respond_to :json
      def index
        @service_categories = ServiceCategory.all
        respond_with @service_categories
      end

      def show
        @service_category = ServiceCategory.find params[:id]
        respond_with @service_category
      end
    end
  end
end
