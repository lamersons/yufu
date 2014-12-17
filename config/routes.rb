Yufu::Application.routes.draw do

  default_url_options host: Rails.application.config.host

  put 'translations/update'
  mount Mercury::Engine => '/'
  root to: 'main#index'
  root to: 'vacancies#index', constraints: {subdomain: 'jobs'}

  devise_for :admin
  devise_for :users

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  resource :user
  resources :banners, only: :show
  resources :vacancies, only: :index

  namespace :api do
    namespace :v1 do
      resources :languages,     only: [:index, :show]
      resources :directions,    only: [:index, :show]
      resources :cities,        only: [:index, :show]
      resources :localizations, only: [:index, :show]
      resources :users,         only: [:index, :show, :update, :create]
      resources :banners,       only: [:index, :show, :update, :create]
      resources :messages,      only: [:index, :show, :create]
      resources :profiles
      resources :translations, constraints: { id: /[0-z\.]+/ }
      # Should be subresources of profile. but emberjs not suppored it.
      # For access to this resources profile_id should be passed
      resources :applications, only: [:index, :show, :update, :create], path: 'order_applications'
      resources :orders,       only: [:index, :show, :update, :create]
      resources :partners_clients, only: [:index, :show, :update, :create]
      get 'languages_groups_price', to: 'languages_groups#price'
      # end subresource of profile

    end
  end

  resources :orders, only: [:new, :create, :edit, :update]

end
