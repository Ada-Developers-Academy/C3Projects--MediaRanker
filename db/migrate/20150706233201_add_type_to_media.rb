class AddTypeToMedia < ActiveRecord::Migration
  def change
    add_column :media, :media_type, :string
  end
end
