class AddColumnToPlaylists < ActiveRecord::Migration[6.0]
  def change
    add_column :playlists, :private, :boolean, default:true
  end
end
