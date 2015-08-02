class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :name, null: false
      t.string :creator
      t.string :description
      t.integer :rank, default: 0
      t.timestamps null: false
    end
  end
end
