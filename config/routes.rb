Rails.application.routes.draw do
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  post '/logout' => 'sessions#destroy'
  delete '/posts/:id', to: 'posts#destroy', as:'post'

  get '/auth/facebook/callback' => 'omniauth_callbacks#facebook'

  resources :users, only: [:new, :create] 
  resources :posts
  resources :authors
  resources :genres

  root 'welcome#home'
end