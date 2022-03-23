Rails.application.routes.draw do
  get 'pages/home'
  devise_for :users

  resources :categories
  
  
  root "pages#home"
end
