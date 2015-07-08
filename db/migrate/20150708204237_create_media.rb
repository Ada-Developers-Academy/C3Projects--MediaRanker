class CreateMedia < ActiveRecord::Migration
  def change
    create_table :media do |t|
      t.string :name
      t.string :description
      t.string :creator
      t.string :format
      t.integer :votes

      t.timestamps null: false
    end
  end
end
