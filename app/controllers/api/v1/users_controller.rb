module Api
  module V1
    class UsersController < ApplicationController
      before_action :authenticate_user!, only: :update

      respond_to :json

      # Registration
      def create
        @user = User.new user_params
        @user.profiles << params[:user][:_type].constantize.new
        @user.password = Devise.friendly_token.first(8)
        if @user.save
          UsersMailer.create(@user).deliver
          render json: {success: true}
        else
          @user.try :clean_up_passwords
          render json: {:success => false}
        end
      end

      def update
        if current_user.update(user_params)
          head :ok
        else
          render json: current_user.errors, status: :unprocessable_entity
        end
      end

      def show
        @user = User.find params[:id]
        respond_with @user
      end

      def index
        @users = User.all
        respond_with @users
      end

      private
      def user_params
        params.require(:user).permit :email, :overlord_id
      end
    end

  end
end
