Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :programs, only: %i[index]
      resources :variations, only: %i[index]
      resources :variation_programs, only: %i[index]
      resources :steps, only: %i[index]
      resources :dancers, only: %i[index]
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
