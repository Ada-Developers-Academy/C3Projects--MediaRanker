class AddRankToBooks < ActiveRecord::Migration
  def change
    add_column :books, :rank, :integer
  end
end
