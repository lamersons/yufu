module Api
  module V1
    class UsersController < ApplicationController
      before_action :authenticate_user!, only: :update

      respond_to :json

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
        params.require(:user).permit :email
      end
    end

  end
end
