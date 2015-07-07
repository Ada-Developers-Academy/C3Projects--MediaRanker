class CreateMedia < ActiveRecord::Migration
  def change
    create_table :media do |t|
      t.string  :title, null: false
      t.string  :artist # other flavor text: director author
      t.text    :description
      t.integer :upvotes, null: false
      t.string  :category, null: false

      t.timestamps null: false
    end
  end
end
