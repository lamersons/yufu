module Api
  module V1
    class PartnersClientsController < ApplicationController
      respond_to :json
      before_action :authenticate_user!
      before_action :set_profile


      def show
        @partners_client = PartnersClient.find params[:id]
        respond_with @partners_client
      end

      def index
        @partners_clients = @profile.clients
        respond_with @partners_clients
      end

      def create
        @partners_client = @profile.clients.new partners_client_params
        if @partners_client.save
          respond_with @partners_client, statue: :created, location: api_v1_partners_client_url(@partners_client)
        else
          respond_with @partners_client.errors, status: :unprocessable_entity
        end
      end

      def update
        @partners_client = @profile.clients.find params[:id]
        if @partners_client.update partners_client_params
          respond_with @partners_client, statue: :updated, location: api_v1_partners_client_url(@partners_client)
        else
          respond_with @partners_client.errors, status: :unprocessable_entity
        end
      end

      private
        def set_profile
          @profile = Profile::Base.find params[:profile_id]
        end
        def partners_client_params
          params.require(:partners_client).permit :first_name, :last_name
        end
    end
  end
end

