class DropMoviesTable < ActiveRecord::Migration
  def up
    drop_table :movies
  end

  def down
    create_table :movies do |t|
      t.string :title
      t.string :directed_by
      t.integer :votes
      t.text :description

      t.timestamps null: false
    end
  end
end
