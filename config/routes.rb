Rails.application.routes.draw do
  root 'welcome#hello'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete "logout", to: "sessions#destroy", as: "logout"
  get '/share/:id' => 'playlists#share', as: "share"
  patch '/share/:id' => 'playlists#share_playlist', as: "share_playlist"
  post '/playlists/:id/like', to: 'playlists#like', as: 'like'



  resources :playlists
  resources :songs, only: [:index, :show]
  resources :users, except: [:destroy]

end
