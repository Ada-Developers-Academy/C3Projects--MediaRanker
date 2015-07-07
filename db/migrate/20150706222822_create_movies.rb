class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :title
      t.string :description
      t.string :author
      t.integer :ranking, default: 1

      t.timestamps null: false
    end
  end
end
