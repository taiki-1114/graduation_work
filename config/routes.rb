Rails.application.routes.draw do
  resources :users, only: %i[new create]
  resources :sessions, only: [:new, :create, :destroy]
  resources :articles
  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root 'articles#index'
  
end
