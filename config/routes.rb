Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :programs, only: %i[index]
      resources :variations, only: %i[index]
      resources :variation_programs, only: %i[index]
      resources :steps, only: %i[index]
      resources :dancers, only: %i[index]

      resources :search_results, only: %i[index]

      post '/register', to: 'users#create'
      post '/login', to: 'sessions#create'
      resource :user, only: %i[show]
    end
  end
end
