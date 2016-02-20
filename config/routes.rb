Rails.application.routes.draw do
  get 'users/create_dailyplate'

  get 'users/create_recurringplate'

  root to: 'users#index'
  resources :users
  resources :breakfastplates
  resources :dinnerplates
  resources :recurringdinnerplates
  resources :recurringbreakfastplates





end
