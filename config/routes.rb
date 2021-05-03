Rails.application.routes.draw do

  root 'products#index'

    #signing up
    get '/signup', to: 'users#new'
    post '/signup', to: 'users#create'
  
    #logging in
    get 'auth/:provider/callback', to: 'sessions#omniauth'
    get '/login', to: "sessions#new"
    post '/login', to: "sessions#create"
    delete '/logout', to: "sessions#destroy"

  resources :categories do
    resources :products, only: %i[index new create]
  end

  get 'carts/:id' => "carts#show", as: "cart"
  delete 'carts/:id' => "carts#destroy"

  post 'order_items/:id/add' => "order_items#add_quantity", as: "order_item_add"
  post 'order_items/:id/reduce' => "order_items#reduce_quantity", as: "order_item_reduce"
  post 'order_items' => "order_items#create"
  get 'order_items/:id' => "order_items#show", as: "order_item"
  delete 'order_items/:id' => "order_items#destroy"

  resources :users, except: :new
  resources :products
  resources :admins
  resources :orders
 

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  
  # get '/users/reset_password', to: 'users#reset_form'
  # post '/users/reset_password', to: 'users#password_reset'
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
