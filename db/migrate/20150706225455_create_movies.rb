class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :name
      t.string :description
      t.string :director
      t.integer :votes

      t.timestamps null: false
    end
  end
end
