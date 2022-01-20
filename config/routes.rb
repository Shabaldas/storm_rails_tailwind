Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  put 'locales/:locale', to: 'locales#update', as: :locale,
                         constraints: { locale: /#{I18n.available_locales.join('|')}/ }
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks', sessions: 'my_session' }
  root 'static_pages#home', as: :home

  get 'print', to: 'static_pages#print', as: :print
  get 'rendering', to: 'static_pages#rendering', as: :rendering
  get 'modeling', to: 'static_pages#modeling', as: :modeling
end
