class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string  :title, null: false
      t.string  :author, default: "N/A"
      t.integer :ranking, default: 0
      t.string  :description

      t.timestamps null: false
    end
  end
end
