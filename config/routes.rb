Rails.application.routes.draw do
  get 'pages/home'
  devise_for :users

  resources :activities

  resources :categories
   
  
  root "pages#home"
end
