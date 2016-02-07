Rails.application.routes.draw do
  root to: 'plates#index'
  resources :plates
end
