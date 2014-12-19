require 'rails_admin/config/actions'
require 'rails_admin/config/actions/base'

module RailsAdminReply
end

module RailsAdmin
  module Config
    module Actions
      class Reply < RailsAdmin::Config::Actions::Base
        register_instance_option :visible? do
          bindings[:object].is_a?(Message) && !bindings[:object].from_backoffice?
        end

        register_instance_option :link_icon do
          'icon-share-alt'
        end

        register_instance_option :member do
          true
        end
        register_instance_option :controller do
          Proc.new do
            recipient = @object.sender
            @object = Message.new recipient: recipient, sender: current_admin
            render 'new'
          end
        end
      end
    end
  end
end
