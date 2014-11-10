Yufu::Application.routes.draw do

  root to: 'main#index'

  mount RailsAdmin::Engine => '/administration', as: 'rails_admin'
  mount I18nDashboard::Engine => '/i18n_dashboard'

  devise_for :admin
  devise_for :users


  namespace :api do
    namespace :v1 do
      resources :languages,          only: [:index, :show]
      resources :service_categories, only: [:index, :show]
      resources :cities,             only: [:index, :show]
      resources :users,              only: [:index, :show, :update, :create]
      resources :profiles
    end
  end

end
