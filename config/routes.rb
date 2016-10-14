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
