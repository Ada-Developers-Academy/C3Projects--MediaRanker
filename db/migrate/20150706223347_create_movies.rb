class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :name, null: false
      t.string :director, null: false
      t.string :description, null: false
      t.integer :rank, null: false, default: 0

      t.timestamps null: false
    end
  end
end
