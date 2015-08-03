class CreateMedia < ActiveRecord::Migration
  def change
    create_table :media do |t|
      t.string :title
      t.string :creator, default: ""
      t.integer :votes, default: 0
      t.text :description, default: ""
      t.string :format

      t.timestamps null: false
    end
  end
end
