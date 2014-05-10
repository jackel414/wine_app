WineApp::Application.routes.draw do
  root :to => "sessions#welcome"
  get "log_out" => "sessions#destroy", :as => "log_out"
  get "log_in" => "sessions#new", :as => "log_in"
  get "home" => "wines#index"
  get "wines" => "wines#cellar"
  get "inactive" => "users#inactive"
  put "/wines/:id/drink" => "wines#drink", as: :drink_wine
  put "/wines/:id/catalog" => "wines#catalog", :as => "catalog_wine"
  post "/users/:id/deactivate" => "users#deactivate", :as => "deactivate_user"
  post "/users/:id/activate" => "users#activate", :as => "activate_user"
  resources :wines
  resources :users
  resources :sessions
end
