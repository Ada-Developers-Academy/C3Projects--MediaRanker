class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.string :creator
      t.text :description
      t.integer :rank, default: 0

      t.timestamps null: false
    end
  end
end
