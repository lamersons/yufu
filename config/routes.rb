Yufu::Application.routes.draw do


  root to: 'main#index'

  mount RailsAdmin::Engine => '/administration', as: 'rails_admin'
  mount I18nDashboard::Engine => '/i18n_dashboard'

  devise_for :admin
  devise_for :user, controllers: { registrations: 'users/registrations', passwords: 'users/passwords' }

  resource :user

  namespace :api do
    namespace :v1 do
      resources :languages,  only: [:index, :show]
      resources :directions, only: [:index, :show]
      resources :cities,     only: [:index, :show]
      resources :user,      only: [:index, :show, :update, :create]
      resources :profiles
    end
  end

end
