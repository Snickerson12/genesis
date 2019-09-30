Rails.application.routes.draw do
  root 'welcome#hello'
  resources :playlists
end
