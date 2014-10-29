Yufu::Application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :languages, only: [:index, :show]
      resources :cities, only: [:index, :show]
    end
  end

end
