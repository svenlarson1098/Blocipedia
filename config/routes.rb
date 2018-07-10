Rails.application.routes.draw do
  
  resources :wikis
  resources :charges
  put '/downgrade', to: 'downgrade#update', as: :downgrade
  
  resources :collaborators, only: [:new, :create, :destroy]
  
  devise_for :users
  
  get 'about' => 'welcome#about'

  authenticated :user do
    root 'wikis#index', as: :authenticated_root
  end
  
  root 'welcome#index'
  
  resources :charges, only: [:new, :create]
  
end
