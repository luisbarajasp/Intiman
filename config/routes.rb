Rails.application.routes.draw do

  resources :colors

  resources :sizes, :except => [:edit, :update]

  resources :users, :only => [:show]

  get 'sales/index'

  resources :categories, except: [:edit,:update]

  resources :brands, except: [:edit,:update]


  resources :cloths

  devise_for :users

  devise_for :admins

  get 'pages/home'

  get 'pages/about'

  get 'pages/contact'

  root to: "pages#home"
end
