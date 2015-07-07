class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title, null: false
      t.string :author
      t.integer :rank
      t.string :description
      t.timestamps null: false
    end
  end
end
