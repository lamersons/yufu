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
          resolve_params!
          params.require(:message).permit :body, attachments_attributes: [:data, :data_file_name]#, :recipient_id
        end

        def set_message
          @message = Message.find params[:id]
        end

        # TODO: should be moved to frontend
        def resolve_params!
          unless params[:message][:attachments].blank?
            params[:message][:attachments_attributes] = params[:message].delete :attachments
            params[:message][:attachments_attributes].each do |a|
              a['data'] = a.delete :file
              a['data_file_name'] = a.delete :file_name
            end
          end
        end
    end
  end
end
