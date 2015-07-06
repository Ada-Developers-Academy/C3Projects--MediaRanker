class CreateMedia < ActiveRecord::Migration
  def change
    create_table :media do |t|
      t.integer :ranking
      t.string :name
      t.string :contributor
      t.string :description
      t.string :user

      t.timestamps null: false
    end
  end
end
