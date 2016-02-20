Rails.application.routes.draw do
  get 'users/create_dailyplate'

  get 'users/create_recurringplate'

  root to: 'users#index'
  resources :users
  resources :breakfastplates
  resources :dinnerplates
  resources :recurringdinnerplate
  resources :recurringbreakfastplate
  get 'add_breakfast_plate' => "users#add_breakfast_plate"
  post 'add_breakfast_plate' => "users#add_breakfast_plate"




end
