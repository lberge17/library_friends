Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks", :registrations => "registrations" }

  resources :books, only: [:index, :show, :new, :create] do
    resources :recommendations, only: [:index]
  end

  resources :libraries, only: [:index, :new, :create, :destroy]

  get '/libraries/popular_books', to: 'libraries#popular_books'

  resources :follows, only: [:index, :create, :destroy]

  get '/users/lookup', to: 'users#lookup'

  resources :users, only: [:show] do
    resources :recommendations, only: [:index, :new, :create, :destroy]
  end

  get 'users/:user_id/recommendations/:id', to: 'recommendations#show'
  
  root to: "welcome#home"
end
