module Api
  module V1
    class ProfilesController < ApplicationController
      respond_to :json
      before_action :authenticate_user!, only: [:create, :update]

      def show
        user = User.find params[:user_id]
        @profile = user.profiles.find params[:id]
      end

      def index
        @profiles = []
        User.all.each{|user| user.profiles.each{|profile| @profiles << profile}}
      end

      def create
        profiles = current_user.profiles.map{|profile| profile._type}
        profiles << 'Profile::Base'
        profiles << 'Profile::Translator::Base'
        if params[:profile][:type].in? profiles
          render json: {success: false}
        else
          current_user.profiles << params[:profile][:type].constantize.new
          if current_user.profiles.last.update_attributes profile_params
            current_user.save
            render json: {success: true}
          else
            render json: {success: false}
          end
        end
      rescue => e
        render json: {success: false}
      end

      def update
        @profile = current_user.profiles.find(params[:id])
        if @profile.update_attributes(profile_params)
          render json: {success: true}
        else
          render json: {success: false}
        end
      rescue => e
        render json: {success: false}
      end

      private
      def profile_params
        params.require(:profile).permit!.except(:type)
      end
    end
  end
end
