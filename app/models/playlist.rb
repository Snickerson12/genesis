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
end
