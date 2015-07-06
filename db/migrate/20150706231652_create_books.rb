class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string  :name, null: false
      t.string  :author
      t.text    :description
      t.integer :upvotes

      t.timestamps null: false
    end
  end
end
