Rails.application.routes.draw do
  devise_for :users
  root "posts#index"
  resources :posts, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
    resources :comments, only: [:create]
  end
  resources :categories, only: [:show]
  resources :users, only: [:show, :edit, :update]
  resources :dogs, only: [:new, :create, :show, :edit, :update, :destroy]
end
