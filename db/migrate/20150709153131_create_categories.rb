class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name
      t.string :full_name
      t.string :creator_noun
      t.string :created_verb

      t.timestamps null: false
    end
  end
end
