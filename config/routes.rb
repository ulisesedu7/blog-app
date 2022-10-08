Rails.application.routes.draw do
  # Defines the root path route ("/")
  # root "articles#index"
  # root "users#index"

  # Posts Routes
  get 'users/:user_id/posts', to: 'posts#index', as: :posts
  get 'users/:user_id/posts/:id', to: 'posts#show', as: :post

  # Users Routes
  get 'users/', to: 'users#index'
  get 'users/:id', to: 'users#show', as: :user

  # New Posts Route
  get 'posts/new', to: 'posts#new', as: :new_post

  # Post routes
  post 'posts/new', to: 'posts#create'
  post 'users/:user_id/posts/:id', to: 'comments#create', as: :comment
  post 'users/:user_id/posts/:id/likes', to: 'likes#create', as: :like
end
