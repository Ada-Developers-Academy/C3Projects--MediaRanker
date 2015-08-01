class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :name
      t.string :director
      t.text :desc
      t.integer :vote

      t.timestamps null: false
    end
  end
end
