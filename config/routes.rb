Yufu::Application.routes.draw do

  default_url_options host: Rails.application.config.host

  put 'translations/update'
  mount Mercury::Engine => '/'

  get '/' => 'vacancies#index', constraints: {subdomain: 'jobs'}
  root to: 'main#index'

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
      resources :verbal_translation_levels, only: :index
      # Should be subresources of profile. but emberjs not suppored it.
      # For access to this resources profile_id should be passed
      resources :applications, only: [:index, :show, :update, :create], path: 'order_applications'
      resources :orders,       only: [:index, :show, :update, :create]
      resources :partners_clients, only: [:index, :show, :update, :create]
      resources :reservation_dates, only: [:index]
      get 'languages_groups_price', to: 'languages_groups#price'
      # end subresource of profile

    end
  end

  resources :orders, only: [:new, :create, :edit, :update] do
    member do
      post :add_available_languages
    end
    collection do
      get :precount_written_price
    end
  end

end
