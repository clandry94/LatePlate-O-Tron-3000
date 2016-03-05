Rails.application.routes.draw do
  get 'sessions/new'

  # root to: 'users#new'
  root to: 'static#index'
  get 'root' => 'static#index'
  get 'signup' => 'users#new'
  get 'create' => 'users#index'
  get 'login' => 'sessions#new'
  get 'manage_plates' => 'users#manage_plates'
  post 'create_breakfast_plate' => 'breakfastplates#create'
  post 'create_dinner_plate' => 'dinnerplates#create'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'

  resources :users
  # resources :breakfastplates
  # resources :dinnerplates
  # resources :recurringdinnerplates
  # resources :recurringbreakfastplates
end
