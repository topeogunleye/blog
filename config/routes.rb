Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  # root "articles#index"
  root "users#index"
  resources :users do
     resources :posts, only: [:show, :index, :new, :create, :destroy] do
      resources :comments, only: [:new, :create, :destroy]
      resources :likes, only: [:new, :create]
  end
end
end
