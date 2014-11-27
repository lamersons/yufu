module Api
  module V1
    class ClientInfosController < ApplicationController
      respond_to :json
      before_action :authenticate_user!
      before_action :set_profile


      def show
        @client_info = Order::ClientInfo.find params[:id]
        respond_with @client_info
      end

      def index
        @client_infos = @profile.clients
        respond_with @client_infos
      end

      def create
        @client_info = @profile.clients.new client_info_params
        if @client_info.save
          respond_with @client_info, statue: :created, location: api_v1_client_info_url(@client_info)
        else
          respond_with @client_info.errors, status: :unprocessable_entity
        end
      end

      def update
        @client_info = @profile.clients.find params[:id]
        if @client_info.update client_info_params
          respond_with @client_info, statue: :updated, location: api_v1_client_info_url(@client_info)
        else
          respond_with @client_info.errors, status: :unprocessable_entity
        end
      end

      private
        def set_profile
          @profile = Profile::Base.find params[:profile_id]
        end
        def client_info_params
          params.require(:client_info).permit :first_name, :last_name
        end
    end
  end
end

