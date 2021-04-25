Rails.application.routes.draw do

  resources :categories do
    resources :products, only: [:index, :new, :create]
  end

  resources :users, only: [:index, :show]
  resources :admins

  get '/signup', to: 'users#new'
  post '/users', to: 'users#create'
  get '/login', to: "sessions#new"
  post '/login', to: "sessions#create"
  get '/logout', to: "sessions#destroy"

  # get 'users/new'
  # get 'users/create'
  # get 'users/show'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'products#homepage'
  # get 'auth/:provider/callback', to: 'sessions#omniauth'
  # get '/users/reset_password', to: 'users#reset_form'
  # post '/users/reset_password', to: 'users#password_reset'
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
