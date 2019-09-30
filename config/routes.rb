Rails.application.routes.draw do
  root 'welcome#hello'
  resources :playlists
  resources :songs, only: [:index, :show]
end
