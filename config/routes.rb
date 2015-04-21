Rails.application.routes.draw do
  resources :listings
  resources :pictures
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  root to: "listings#index"

end
