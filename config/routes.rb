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

  #resources :refunds, :only => [:create]
  post 'refund/:id', :to => 'refunds#refund', :as => 'refund'

  put 'order/:id', :to => 'user_orders#update'

  resources :colors

  resources :promotions

  resources :sizes, :except => [:edit, :update]

  get '/user/account' => 'users#show'

  get '/user/orders' => 'users#orders'

  get '/user/likes' => 'users#likes'

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
