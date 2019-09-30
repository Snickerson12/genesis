class CreateUserPlaylists < ActiveRecord::Migration[6.0]
  def change
    create_table :user_playlists do |t|
      t.integer "playlist_id"
      t.integer "listener_id"

      t.timestamps
    end
  end
end
