class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.string  :title, null: false
      t.string  :artist, default: "N/A"
      t.integer :ranking, default: 0
      t.string  :description

      t.timestamps null: false
    end
  end
end
