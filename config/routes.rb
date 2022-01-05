Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root 'static_pages#home'

  get 'print', to: 'static_pages#print'
  get 'rendering', to: 'static_pages#rendering'
  get 'modeling', to: 'static_pages#modeling'
end
