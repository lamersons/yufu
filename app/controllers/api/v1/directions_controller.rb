module Api
  module V1
    class DirectionsController < ApplicationController
      respond_to :json
      def index
        @directions = Direction.all
        respond_with @directions
      end

      def show
        @direction = Direction.find params[:id]
        respond_with @direction
      end
    end
  end
end
