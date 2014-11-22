Yufu::Application.routes.draw do

  default_url_options host: Rails.application.config.host

  put 'translations/update'
  mount Mercury::Engine => '/'
  root to: 'main#index'

  mount RailsAdmin::Engine => '/administration', as: 'rails_admin'
  mount I18nDashboard::Engine => '/i18n_dashboard'

  devise_for :admin
  devise_for :users

  resource :user
  resources :banners, only: :show

  namespace :api do
    namespace :v1 do
      resources :languages,    only: [:index, :show]
      resources :directions,   only: [:index, :show]
      resources :cities,       only: [:index, :show]
      resources :users,        only: [:index, :show, :update, :create]
      resources :banners,      only: [:index, :show, :update, :create]
      resources :profiles do
        resources :applications, only: [:index, :show, :update, :create]
      end
      resources :orders
    end
  end

end
