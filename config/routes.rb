Yufu::Application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  devise_for :admin, skip: :registrations
  devise_for :users

  namespace :api do
    namespace :v1 do
      resources :languages,          only: [:index, :show]
      resources :service_categories, only: [:index, :show]
      resources :cities,             only: [:index, :show]
      resources :users,              only: [:index, :show, :update]
    end
  end

end
