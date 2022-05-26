Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  put 'locales/:locale', to: 'locales#update', as: :locale,
                         constraints: { locale: /#{I18n.available_locales.join('|')}/ }

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root 'static_pages#home', as: :home

  resources :products, only: [:index, :show] do
    resources :cart_items, only: :create, controller: 'products/cart_items'
  end
  resources :print_models, only: [] do
    post :manage, on: :collection
  end
  get :calculator, to: 'print_models#new', as: :calculator

  resource :checkout, only: :show

  get 'checkout', to: 'orders#checkout', as: :checkout
  get 'print', to: 'static_pages#print', as: :print
  get 'rendering', to: 'static_pages#rendering', as: :rendering
  get 'modeling', to: 'static_pages#modeling', as: :modeling

  namespace :carts do
    resources :cart_items, only: [:create, :destroy] do
      patch :update_quantity, on: :member
      delete :destroy_all, on: :collection
    end
    resource :add, only: [:create]
    resource :reduce, only: [:create]
    resource :remove, only: [:destroy]
  end
  # resources :calculators, only: :index
end
