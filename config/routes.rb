Rails.application.routes.draw do
  resources :comptabilites
  devise_for :users, path: ''
  #devise_for :users, path: '', path_names: {sign_in: 'Login', sign_out: 'Logout', sign_up: 'Register'}, controllers:{sessions: 'users/sessions'}
  get 'pages/index'
  resources :caisses

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'pages#index'
end
