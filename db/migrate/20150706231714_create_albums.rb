class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.string  :name, null: false
      t.string  :artist
      t.text    :description
      t.integer :upvotes

      t.timestamps null: false
    end
  end
end
