Rails.application.routes.draw do
  get 'pages/index'
  resources :caisses
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'pages#index'
end
