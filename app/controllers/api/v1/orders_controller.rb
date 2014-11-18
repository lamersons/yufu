module Api
  module V1
    class OrdersController < ApplicationController

      before_action :authenticate_user!, except: :create
      before_action :set_profile,        except: [:create, :show]

      respond_to :json

      def create
      end

      def update
      end

      def index
        @orders = @profile.orders
        respond_with @orders
      end

      def show
        @order = Order::Base.find params[:id]
        respond_with @order
      end

      private
      def set_profile
        @profile = current_user.profiles.find params[:profile_id]
      end
    end

  end
end