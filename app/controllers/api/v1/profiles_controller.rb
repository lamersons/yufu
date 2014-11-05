module Api
  module V1
    class ProfilesController < ApplicationController
      respond_to :json
      def show
      end

      def index
        respond_with User.first.profiles
      end

      def create
      end

      def update
      end
    end
  end
end
