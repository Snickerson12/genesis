class AddLikesColumnToPlaylists < ActiveRecord::Migration[6.0]
  def change
    add_column :playlists, :likes, :integer, default:0
  end
end
