Rails.application.routes.draw do
  get 'sessions/new'

  #root to: 'users#new'
  root to: 'static#index'
  get 'signup' => 'users#new'
  get 'create' => 'users#index'
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
  resources :users

  resources :breakfastplates
  resources :dinnerplates
  resources :recurringdinnerplates
  resources :recurringbreakfastplates






end
