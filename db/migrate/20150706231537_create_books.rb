class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :name
      t.string :author
      t.text :desc
      t.integer :vote

      t.timestamps null: false
    end
  end
end
