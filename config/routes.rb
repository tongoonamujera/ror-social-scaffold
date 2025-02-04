Rails.application.routes.draw do

  resources :messages
  resources :friendships
  root 'posts#index'

  devise_for :users

  resources :users, only: [:index, :show]
  resources :posts, only: [:index, :create] do
    resources :comments, only: [:create]
    resources :likes, only: [:create, :destroy]
  end

  resources :friendships do
    put :confirm_friendship, on: :member
    delete :delete_friendship, on: :member
    match '/new', to: 'friendships#create', via: :post, on: :collection
    match '/confirm_friend', to: 'friendships#update', via: :post, on: :collection
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
