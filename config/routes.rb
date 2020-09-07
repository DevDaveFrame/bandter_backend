Rails.application.routes.draw do
  resources :user_instruments
  resources :user_genres
  namespace :api do
    namespace :v1 do
      resources :messages
      resources :match_chats
      resources :photos
      resources :genres
      resources :instruments
      resources :songs
      resources :users
    end
  end

  post "api/v1/login", to: "api/v1/auth#create"
  post "api/v1/signup", to: "api/v1/users#create"
  post "api/v1/discover", to: "api/v1/users#query"
  post "api/v1/friend_request", to: "api/v1/match_chats#friending"

  mount ActionCable.server => '/cable'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
