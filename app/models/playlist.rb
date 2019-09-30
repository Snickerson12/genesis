class Playlist < ApplicationRecord
  has_many :user_playlists
  has_many :listeners, through: :user_playlists, class_name: 'User'
  belongs_to :creator, class_name: 'User'
  has_many :song_playlists
  has_many :songs, through: :song_playlists
end
