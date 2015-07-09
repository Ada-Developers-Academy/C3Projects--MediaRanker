class DropAlbumsTable < ActiveRecord::Migration
  def up
    drop_table :albums
  end

  def down
    create_table :albums do |t|
      t.string :title
      t.string :recorded_by
      t.integer :votes
      t.text :description

      t.timestamps null: false
    end
  end
end
