class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.string :title
      t.string :recorded_by
      t.integer :votes
      t.text :description

      t.timestamps null: false
    end
  end
end
