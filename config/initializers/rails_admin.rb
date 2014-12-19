require Rails.root.join('lib', 'rails_admin_pay_order.rb')
require Rails.root.join('lib', 'rails_admin_reply.rb')
RailsAdmin::Config::Actions.register(RailsAdmin::Config::Actions::PayOrder)
RailsAdmin::Config::Actions.register(RailsAdmin::Config::Actions::Reply)

RailsAdmin.config do |config|
  ### Popular gems integration

  ## == Devise ==
  config.authenticate_with do
    warden.authenticate! scope: :admin
  end
  config.current_user_method(&:current_admin)

  ## == Cancan ==
  config.authorize_with :cancan

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app
    pay_order
    reply

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end

  config.model Localization do
    field :name, :enum do
      enum {I18n.available_locales}
    end
    field :enable
  end

  config.model Message do
    list do
      scopes [:backoffice_inbox, :backoffice_outbox]
    end
    field :body, :ck_editor
    include_all_fields
  end

  config.model Permission do
    field :name
    field :action, :enum do
      enum {Permission::AVAILABLE_ACTIONS}
    end
    field :subject_class, :enum do
      enum { %w(User City Direction Language) }
    end
  end

  config.model Price::Verbal do
    field :level, :enum do
      enum {Order::Verbal::TRANSLATION_LEVELS}
    end
    field :value
  end

  config.model Vacancy do
    edit do
      field :name
      field :text, :ck_editor
    end
  end
end
