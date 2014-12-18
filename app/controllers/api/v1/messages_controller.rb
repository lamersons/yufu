module Api
  module V1
    class MessagesController < ApplicationController
      before_action :authenticate_user!
      before_action :set_message, only: [:show]

      respond_to :json

      def create
        @message = current_user.outbox.new message_params
        if @message.save
          respond_with @message, statue: :created, location: api_v1_message_url(@message)
        else
          respond_with @message, status: :unprocessable_entity
        end
      end

      def index
        @messages = scoped_collection
        respond_with @messages
      end

      def show
        authorize! :read, @message
        respond_with @message
      end

      private
        def scoped_collection
          if params[:scope] == 'outbox'
            current_user.outbox
          else
            current_user.inbox
          end
        end

        def message_params
          params.require(:message).permit :body#, :recipient_id
        end

        def set_message
          @message = Message.find params[:id]
        end
    end
  end
end
