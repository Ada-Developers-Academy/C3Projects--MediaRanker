class CreateMedia < ActiveRecord::Migration
  def change
    create_table :media do |t|
      t.string :title
      t.string :creator
      t.text :description
      t.string :format
      t.integer :rank

      t.timestamps null: false
    end
  end
end
