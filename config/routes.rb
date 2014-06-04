WineApp::Application.routes.draw do
  root :to => "sessions#welcome"
  get "log_out" => "sessions#destroy", :as => "log_out"
  get "log_in" => "sessions#new", :as => "log_in"
  #get "home" => "wines#index"
  get 'home' => 'users#home'
  get "wines" => "wines#cellar"
  get "inactive" => "users#inactive"
  get 'admin' => 'users#admin'
  put "/wines/:id/catalog" => "wines#catalog", :as => "catalog_wine"
  post "/users/:id/deactivate" => "users#deactivate", :as => "deactivate_user"
  post "/users/:id/activate" => "users#activate", :as => "activate_user"
  get "/province_list" => "provinces#province_list"
  get "/grapes_list" => "grapes#grapes_list"
  resources :wines
  resources :users
  resources :sessions
  resources :regions
  resources :countries
  resources :provinces
  resources :grapes
end
