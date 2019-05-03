Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      get 'publications/search', to: 'publications#search'
      resources :authors do
        resources :publications, only: :index
      end
      resources :publications, exclude: :index
    end
  end
end
