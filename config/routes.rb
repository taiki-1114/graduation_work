Rails.application.routes.draw do
  get 'static_pages/terms_of_service'
  resources :users, only: %i[new create]
  resources :sessions, only: [:new, :create, :destroy]
  resources :articles,only: %i[index new create show edit update destroy] do
    collection do
      get :search
      get :bookmarks
    end
  end
  resources :bookmarks, only: %i[create destroy]
  resources :article_likes, only: %i[create destroy]
  namespace :admin do
    root "articles#index"
    get 'login' => 'user_sessions#new', :as => :login
    post 'login' => "user_sessions#create"
    delete 'logout' => 'user_sessions#destroy', :as => :logout
    resources :articles, only: %i[new index edit update show destroy create]
  end
  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root 'articles#index'
  get 'terms_of_service', to: 'static_pages#terms_of_service'
  get 'privacy_policy', to: 'static_pages#privacy_policy'
  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?
  
end
