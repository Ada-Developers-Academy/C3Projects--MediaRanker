class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.string :title, null: false
      t.string :artist
      t.integer :rank
      t.string :description
      t.timestamps null: false
    end
  end
end
