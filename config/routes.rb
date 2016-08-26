Rails.application.routes.draw do
  devise_for :users

  resources :goods, only: [:index]

  # Cart routes
  get    "cart"           => "cart#show"
  post   "cart/:good_id"  => "cart#add"
  delete "cart/:good_id"  => "cart#destroy"
  delete "cart/all"       => "cart#destroy_all"

  namespace :admin do
    resources :goods, except: [:show]
    resources :user, only: [:index] do
      member do
        post   'make_admin'
        delete 'make_user'
      end
    end
  end

  root 'goods#index'
end
