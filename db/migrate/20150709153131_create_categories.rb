class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name, null: false
      t.string :full_name
      t.string :creator_noun, null: false
      t.string :created_verb, null: false

      t.timestamps null: false
    end
  end
end
