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

      resources :mark_programs, only: %i[create destroy]
      resources :mark_dancers, only: %i[create destroy]
      resources :mark_steps, only: %i[create destroy]
      resources :mark_variations, only: %i[create destroy]

      resources :in_app_searches, only: %i[index]
      resources :autocompletes, only: %i[index]
    end
  end
end
