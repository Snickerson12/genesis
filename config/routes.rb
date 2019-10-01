Rails.application.routes.draw do
  root 'welcome#hello'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete "logout", to: "sessions#destroy", as: "logout"
  resources :playlists
  resources :songs, only: [:index, :show]
  resources :users, except: [:destroy]

end
