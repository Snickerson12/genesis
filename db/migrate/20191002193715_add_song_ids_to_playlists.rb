class AddSongIdsToPlaylists < ActiveRecord::Migration[6.0]
  def change
    add_column :playlists, :song_ids, :string
  end
end
