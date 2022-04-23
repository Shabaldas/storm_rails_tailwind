Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  put 'locales/:locale', to: 'locales#update', as: :locale,
                         constraints: { locale: /#{I18n.available_locales.join('|')}/ }

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root 'static_pages#home', as: :home

  resources :products, only: [:index, :show]
  resource :checkout, only: :show

  get 'print', to: 'static_pages#print', as: :print
  get 'rendering', to: 'static_pages#rendering', as: :rendering
  get 'modeling', to: 'static_pages#modeling', as: :modeling

  namespace :carts do
    resource :add, only: [:create]
    resource :reduce, only: [:create]
    resource :remove, only: [:destroy]
  end
end
