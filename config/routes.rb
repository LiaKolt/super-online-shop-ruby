Rails.application.routes.draw do
  devise_for :users

  resources :goods, only: [:index]

  resource  :cart

  namespace :admin do
    resources :goods
  end

  root 'goods#index'
end
