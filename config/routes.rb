Rails.application.routes.draw do
  get 'users/show'


  resources :categories, except: [:edit,:update]
  
  resources :brands, except: [:edit,:update]


  resources :clothes

  devise_for :users

  devise_for :admins

  get 'pages/home'

  get 'pages/about'

  get 'pages/contact'

  root to: "pages#home"
end
