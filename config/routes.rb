Rails.application.routes.draw do
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  post '/logout' => 'sessions#destroy'
  delete '/posts/:id', to: 'posts#destroy', as:'post'

  get '/auth/facebook/callback' => 'sessions#omniauth'

  resources :users, only: [:new, :create] do
    resources :posts, shallow: true
  end
  resources :authors
  resources :genres

  root 'welcome#home'
end