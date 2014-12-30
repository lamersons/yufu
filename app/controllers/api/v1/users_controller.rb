module Api
  module V1
    class UsersController < ApplicationController
      before_action :authenticate_user!, only: :update

      respond_to :json

      # Registration
      def create
        @user = User.new user_params
        @user.profiles << params[:user][:_type].constantize.new if params[:user][:_type].present?
        @user.password = Devise.friendly_token.first(8)
        if @user.save
          UsersMailer.create(@user).deliver
          respond_with @user
        else
          @user.try :clean_up_passwords
          respond_with @user, status: :unprocessable_entity
        end
      end

      def update
        if current_user.update(user_params)
          respond_with current_user, statue: :updated, location: false
        else
          render json: current_user.errors, status: :unprocessable_entity
        end
      end

      def show
        @user = User.find params[:id]
        respond_with @user
      end

      def index
        @users = User.without_admins.search(params[:q]).result.paginate(per_page: 10, page: params[:page])
        respond_with @users, serializer: PaginationSerializer
      end

      private
      def user_params
        params.require(:user).permit :email, :overlord_id, :duplicate_messages_on_email, :duplicate_messages_on_sms
      end
    end

  end
end
