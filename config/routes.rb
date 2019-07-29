Rails.application.routes.draw do
  devise_for :users
  root to: 'books#start'
  resources :books, only: [:new, :create, :index, :show, :edit, :update, :destroy]
  get 'home/about' => 'books#about'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:show, :index, :edit, :update]
end
