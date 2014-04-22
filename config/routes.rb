WineApp::Application.routes.draw do
  root :to => "sessions#welcome"
  get "log_out" => "sessions#destroy", :as => "log_out"
  get "log_in" => "sessions#new", :as => "log_in"
  get "home" => "wines#index"
  get "wines" => "wines#cellar"
  get "/wines/:id/drink" => "wines#drink", as: :drink_wine
  put "/wines/:id/catalog" => "wines#catalog", :as => "catalog_wine"
  resources :wines
  resources :users
  resources :sessions
end
