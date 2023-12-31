Rails.application.routes.draw do
  get 'charts/index'
  get "friendships/create"
  get "friendships/destroy"
  # get 'favourite_posts/create'
  # get 'favourite_posts/destroy'
  # get 'likes/create'
  # get 'likes/destroy'
  get "comments/create"
  get "comments/update"
  get "comments/destroy"
  get "posts/index"
  get "posts/new"
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :notifications, only: [:index]
  resources :posts, except: :show do
    resources :comments
    resources :likes, only: [:create, :destroy]
    resources :favourite_posts, only: [:create, :destroy]
  end

  resources :users do
    resources :friendships, only: [:create]
  end
  resources :friendships, only: [:index, :destroy]

  resources :friendships, only: [] do
    member do
      patch :accept
      patch :reject
    end
  end
  resources :charts, only: [:index]
end
