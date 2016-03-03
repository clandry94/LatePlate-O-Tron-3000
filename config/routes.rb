Rails.application.routes.draw do
  #root to: 'users#new'
  root to: 'static#index'
  get 'create' => 'users#index'


  resources :users
  resources :breakfastplates
  resources :dinnerplates
  resources :recurringdinnerplates
  resources :recurringbreakfastplates





end
