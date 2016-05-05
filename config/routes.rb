Rails.application.routes.draw do

  resources :home_sliders, :except => [:show]

  devise_for :users, controllers: { omniauth_callbacks: 'omniauth_callbacks', :sessions => "custom_sessions" }

  match '/users/:id/finish_signup' => 'users#finish_signup', via: [:get, :patch], as: :finish_signup

  devise_for :admins

  #resources :carts, :only => [:show]
  get '/cart' => 'carts#show'

  resources :order_items, :only => [:create, :update, :destroy]

  get '/orders/buyed' => 'admin_orders#buyed'
  get '/orders/shipped' => 'admin_orders#shipped'
  get '/orders/cancelled' => 'admin_orders#cancelled'

  get '/checkout' => 'user_orders#edit'

  put 'order/:id', :to => 'user_orders#update'
  #patch 'order/:id', :to => 'user_orders#update'

  #patch "/checkout" => "user_orders#update", :as => "user_orders/update"

  resources :user_orders, :only => [:index]

  resources :colors

  resources :promotions

  resources :sizes, :except => [:edit, :update]

  resources :users, :only => [:show]

  get 'users/likes', :path => 'likes'

  get 'sales/index', :path => 'sales'

  resources :categories

  resources :brands, except: [:edit,:update]


  resources :cloths do
      member do
        put "like", to: "cloths#like"
        put "dislike", to: "cloths#unlike"
      end
  end

  get 'pages/home'

  get 'pages/about'

  get 'pages/contact'

  get 'pages/help'

  get 'pages/legal'


  root to: "pages#home"

  get '*path' => redirect('/')

end
