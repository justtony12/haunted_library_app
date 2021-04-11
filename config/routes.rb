Rails.application.routes.draw do
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  post '/logout' => 'sessions#destroy'

  delete '/posts/:id', to: 'posts#destroy', as:'post'

  resources :users, only: [:new, :create]
  resources :posts
  resources :authors
  resources :genres

  root 'welcome#home'
end

# Look up routes and resources modules on learn and fix routes and all has_many/belongs_to relationships