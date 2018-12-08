Rails.application.routes.draw do

  devise_for :users

  root to: 'root#home'

  resources :users, only: [:new, :index, :show, :edit, :update]

  resources :books, only: [:index, :show, :create, :edit, :update, :destroy]

end