Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      resources :users, only: [:create]
      resources :trips
      post '/login', to: 'auth#create'
      get '/profile', to: 'users#profile'
      get '/logout', to: 'auth#destroy'
    end
  end
end
