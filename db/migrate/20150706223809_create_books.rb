class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :name
      t.string :author
      t.string :description
      t.integer :ranking, :default => 0

      t.timestamps null: false
    end
  end
end
