class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :title, null: false
      t.string :director
      t.integer :rank
      t.string :description
      t.timestamps null: false
    end
  end
end
