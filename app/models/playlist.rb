class Playlist < ApplicationRecord
  has_many :user_playlists
  has_many :listeners, through: :user_playlists, class_name: 'User'
  belongs_to :creator, class_name: 'User'
  has_many :song_playlists
  has_many :songs, through: :song_playlists
  validates :name, presence: :true

  def public_display
    if self.private == true
      "This playlist is private"
    else
      "This playlist is public"
    end
  end

  def self.most_liked
    most_liked = 0
    Playlist.all.each do |playlist|
      if playlist.likes > most_liked
        @playlist = playlist
        most_liked = playlist.likes
      end
    end
    @playlist
  end

  def self.most_songs
    most_songs = 0
    Playlist.all.each do |playlist|
      if playlist.songs.count > most_songs
        @playlist = playlist
        most_songs = playlist.songs.count
      end
    end
    @playlist

  end

  def self.random_playlist
    @playlist = Playlist.all.sample
  end
end
