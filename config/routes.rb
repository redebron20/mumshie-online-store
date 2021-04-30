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

  get 'orders/:id' => "orders#show", as: "order"
  delete 'orders/:id' => "orders#destroy"

  post 'order_items/:id/add' => "order_items#add_quantity", as: "order_item_add"
  post 'order_items/:id/reduce' => "order_items#reduce_quantity", as: "order_item_reduce"
  post 'order_items' => "order_items#create"
  get 'order_items/:id' => "order_items#show", as: "order_item"
  delete 'order_items/:id' => "order_items#destroy"

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
