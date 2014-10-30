Yufu::Application.routes.draw do

  devise_for :users

  namespace :api do
    namespace :v1 do
      resources :languages, only: [:index, :show]
      resources :cities,    only: [:index, :show]
      resources :users,     only: [:index, :show, :update]
    end
  end

end
