Rails.application.routes.draw do
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  post '/logout' => 'sessions#destroy'
  root 'welcome#hello'
  resources :playlists
  resources :songs, only: [:index, :show]
  resources :users, only: [:new, :create]

end
