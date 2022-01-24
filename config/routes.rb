Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  put 'locales/:locale', to: 'locales#update', as: :locale,
                         constraints: { locale: /#{I18n.available_locales.join('|')}/ }

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root 'static_pages#home', as: :home

  resources :stores, only: :index
  get 'print', to: 'static_pages#print', as: :print
  get 'rendering', to: 'static_pages#rendering', as: :rendering
  get 'modeling', to: 'static_pages#modeling', as: :modeling
end
