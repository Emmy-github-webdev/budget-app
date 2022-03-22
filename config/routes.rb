Rails.application.routes.draw do
  get 'pages/home'
  devise_for :users

  resources :users do
    resources :categories
  end
  
  root "pages#home"
end
