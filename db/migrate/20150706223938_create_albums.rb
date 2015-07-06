class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.string :name, null: false
      t.string :artist, null: false
      t.string :description, null: false
      t.integer :rank, null: false, default: 0

      t.timestamps null: false
    end
  end
end
