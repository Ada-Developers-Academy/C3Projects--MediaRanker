class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :name
      t.string :creator
      t.string :description
      t.integer :rank

      t.timestamps null: false
    end
  end
end
