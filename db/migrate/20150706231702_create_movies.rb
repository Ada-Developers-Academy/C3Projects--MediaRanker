class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string  :name, null: false
      t.string  :director
      t.text    :description
      t.integer :upvotes

      t.timestamps null: false
    end
  end
end
