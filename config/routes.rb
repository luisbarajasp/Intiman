Rails.application.routes.draw do

  devise_for :users

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
