Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks", :registrations => "registrations" }

  resources :books

  resources :libraries, only: [:index, :new, :create, :destroy]

  resources :users, only: [:show] do
    resources :recommendations
  end
  
  root to: "welcome#home"
end
