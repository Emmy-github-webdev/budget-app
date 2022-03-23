Rails.application.routes.draw do
  get 'pages/home'
  devise_for :users

  resources :categories
  resources :activities
  
  
  root "pages#home"
end
