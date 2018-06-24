Rails.application.routes.draw do
  
  resources :wikis

  devise_for :users
  
  get 'about' => 'welcome#about'

  authenticated :user do
    root 'wikis#index', as: :authenticated_root
  end
  
  root 'welcome#index'
  
  resources :charges, only: [:new, :create]
  
end
