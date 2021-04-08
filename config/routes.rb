Rails.application.routes.draw do
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  post '/logout' => 'sessions#destroy'

  resources :users, only: [:new, :create]
  resources :posts, only: [:new, :create, :index, :show, :edit, :update, :destroy] #might remove these
  resources :authors, only: [:new, :create, :index, :show, :edit, :update, :destroy] #might remove these

  root 'welcome#home'
end
