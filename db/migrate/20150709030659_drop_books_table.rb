class DropBooksTable < ActiveRecord::Migration
  def up
    drop_table :books
  end

  def down
    create_table :books do |t|
      t.string :title
      t.string :written_by
      t.integer :votes
      t.text :description

      t.timestamps null: false
    end
  end
end
