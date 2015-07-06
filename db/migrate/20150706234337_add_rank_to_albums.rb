class AddRankToAlbums < ActiveRecord::Migration
  def change
    add_column :albums, :rank, :integer
  end
end
