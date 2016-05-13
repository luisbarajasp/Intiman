Rails.application.routes.draw do

  resources :home_sliders, :except => [:index,:show]

  devise_for :users, controllers: { omniauth_callbacks: 'omniauth_callbacks', :sessions => "custom_sessions" }

  match '/users/:id/finish_signup' => 'users#finish_signup', via: [:get, :patch], as: :finish_signup

  devise_for :admins

  get '/admin/dashboard' => 'dashboard#index'
  get '/admin/home_sliders' => 'dashboard#home_sliders'
  get '/admin/promotions' => 'dashboard#promotions'
  get '/admin/cloths' => 'dashboard#cloths'
  get '/admin/orders' => 'dashboard#orders'

  resources :orders, :only => [:show,:edit,:update]

  get '/cart' => 'carts#show'

  resources :order_items, :only => [:create, :update, :destroy]

  get '/admin/orders/buyed' => 'admin_orders#buyed'
  get '/admin/orders/shipped' => 'admin_orders#shipped'
  get '/admin/orders/cancelled' => 'admin_orders#cancelled'

  get '/checkout' => 'user_orders#edit'

  #resources :refunds, :only => [:create]
  post 'refund/:id', :to => 'refunds#refund', :as => 'refund'

  put 'order/:id', :to => 'user_orders#update'

  resources :colors

  resources :promotions, :except => [:index]

  resources :sizes, :except => [:edit, :update]

  get '/user/account' => 'users#show'

  get '/user/orders' => 'users#orders'

  get '/user/likes' => 'users#likes'

  get 'sales/index', :path => 'sales'

  resources :categories

  resources :brands, except: [:edit,:update]


  resources :cloths, except: [:index] do
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
