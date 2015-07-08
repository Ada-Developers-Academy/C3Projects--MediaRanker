class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :name
      t.string :description
      t.string :author
      t.integer :votes

      t.timestamps null: false
    end
  end
end
