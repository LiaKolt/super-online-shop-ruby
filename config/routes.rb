Rails.application.routes.draw do
  devise_for :users

  resources :goods, only: [:index]

  # Cart routes
  resource :cart, only: [:show, :create, :destroy] do
    post :proceed
  end

  # Admin routes
  get "admin",  to: redirect('/admin/goods')

  namespace :admin do
    resources :goods, only: [:index, :update, :destroy, :create]
    # TODO: В данной версии у нас нет возможности создать и удалить администратора.
    #       Сделать это можно только через Базу Данных.
  end

  root 'goods#index'
end
