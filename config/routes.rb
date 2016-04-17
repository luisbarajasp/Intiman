Rails.application.routes.draw do

  resources :home_sliders, :except => [:show]

  devise_for :users, controllers: { omniauth_callbacks: 'omniauth_callbacks' }

  match '/users/:id/finish_signup' => 'users#finish_signup', via: [:get, :patch], as: :finish_signup

  devise_for :admins

  resources :colors

  resources :sizes, :except => [:edit, :update]

  resources :users, :only => [:show]

  get 'sales/index', :path => 'sales'

  resources :categories, except: [:edit,:update]

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

  root to: "pages#home"

end
