Rails.application.routes.draw do

  root 'products#index'

    #signing up
    get '/signup', to: 'users#new'
    post '/signup', to: 'users#create'
  
    #logging in
    get '/login', to: "sessions#new"
    post '/login', to: "sessions#create"
    delete '/logout', to: "sessions#destroy"

  resources :categories do
    resources :products, only: %i[index new create]
  end

  resources :order_items

  resources :users, except: :new
  resources :products
  resources :admins
  resources :orders
  resources :carts, only: :show

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  # get 'auth/:provider/callback', to: 'sessions#omniauth'
  # get '/users/reset_password', to: 'users#reset_form'
  # post '/users/reset_password', to: 'users#password_reset'
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
