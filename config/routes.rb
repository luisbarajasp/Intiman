Rails.application.routes.draw do
  get 'sizes/index'

  get 'sizes/new'

  get 'sizes/show'

  get 'sizes/edit'

  get 'colors/index'

  get 'colors/show'

  get 'colors/new'

  get 'colors/edit'

  get 'variants/new'

  get 'characteristics/new'

  resources :colors

  resources :sizes

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
