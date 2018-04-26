Rails.application.routes.draw do
  root to: 'index#index'
  get 'index/index'
  post 'index/index'

  resources :plane_airports
  resources :user_trips
  resources :trips
  resources :planes
  resources :airports
  resources :countries
  resources :users
end
