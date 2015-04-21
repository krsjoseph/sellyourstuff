Rails.application.routes.draw do
  resources :listings
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  root to: "listings#index"

end
