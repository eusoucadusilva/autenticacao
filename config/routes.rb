Autenticacao::Application.routes.draw do

  resources :users
  resources :pages

  resource :session

  match "/login"    => "sessions#new",      :as => "login"
  match "/logout"   => "sessions#destroy",  :as => "logout"

  match "/home"     => "pages#index",       :as => :home
  match "/service"  => "pages#service",     :as => :service
  match "/about"    => "pages#about",       :as => :about

  root :to => "pages#index"
  get 'pages/index'

end
