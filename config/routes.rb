Rails.application.routes.draw do
  devise_for :users

  resources :goods, only: [:index]

  # Cart routes
  get    "cart"           => "cart#show"
  post   "cart/:good_id"  => "cart#add"
  delete "cart/:good_id"  => "cart#destroy"
  delete "cart/all"       => "cart#destroy_all"

  namespace :admin do
    resources :goods
  end

  root 'goods#index'
end
