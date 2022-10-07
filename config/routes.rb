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
end
