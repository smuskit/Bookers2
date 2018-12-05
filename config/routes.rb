Rails.application.routes.draw do
  get 'root/home'
  get 'users/index'
  get 'users/show'
  get 'users/edit'
  get 'users/update'

  devise_for :users

  root to: 'root#home'
  root 'users#show'

  resources :users, only: [:index, :show, :edit, :update]

  resources :books, only: [:index, :show, :create, :edit, :update, :destroy]

end