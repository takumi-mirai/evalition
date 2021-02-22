Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  root to: 'topics#index'
  get 'make_topic', to: 'topics#new'
  post 'make_topic', to: 'topics#create'
  resources :topics, only: [:show]
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  get 'signup', to: 'users#new'
  post 'signup', to: 'users#create'
  resources :users, only: [:show, :edit, :update, :destroy]
  
  post 'topics/:id', to: 'posts#create'

end
