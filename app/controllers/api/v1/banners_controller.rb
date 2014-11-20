module Api
  module V1
    class BannersController < ApplicationController
      before_action :authenticate_user!
      before_action :set_banner, only: [:update, :show]

      respond_to :json

      def create
        @banner = current_user.banners.new banner_params
        if @banner.save
          respond_with @banner, statue: :created, location: api_v1_banner_url(@banner)
        else
          respond_with @banner.errors, status: :unprocessable_entity
        end
      end

      def update
        if @banner.update banner_params
          respond_with @banner, statue: :updated, location: api_v1_banner_url(@banner)
        else
          respond_with @banner.errors, status: :unprocessable_entity
        end
      end

      def index
        @banners = current_user.banners
        respond_with @banners
      end

      def show
        respond_with @banner
      end

      private
        def banner_params
          params.require(:banner).permit :name, :width, :height, :image
        end

        def set_banner
          @banner = current_user.banners.find params[:id]
        end
    end
  end
end
