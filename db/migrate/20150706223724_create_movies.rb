class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :name
      t.string :director
      t.string :description
      t.integer :ranking, :default => 0

      t.timestamps null: false
    end
  end
end
