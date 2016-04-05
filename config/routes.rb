Rails.application.routes.draw do
  resources :clothes

  devise_for :users
  devise_for :admins
  get 'pages/home'

  get 'pages/about'

  get 'pages/contact'

  root to: "pages#home"
end
