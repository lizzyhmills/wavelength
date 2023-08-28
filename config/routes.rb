Rails.application.routes.draw do
  get 'posts/index'
  get 'posts/new'
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :posts, except: :show do
    resources :comments
    resources :likes
    resources :favourite_posts
  end

  resources :users do
    resources :friendships
  end
end
