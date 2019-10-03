class AddSpotifyIdToSongs < ActiveRecord::Migration[6.0]
  def change
    add_column :songs, :spotify_id, :string
  end
end
