class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string  :title, null: false
      t.string  :director, default: "N/A"
      t.integer :ranking, default: 0
      t.string  :description

      t.timestamps null: false
    end
  end
end
