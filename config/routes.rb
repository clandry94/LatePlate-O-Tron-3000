Rails.application.routes.draw do
  root to: 'plates#index'
  resources :plates do
    post :delete_entry, :on => :collection
  end

end
