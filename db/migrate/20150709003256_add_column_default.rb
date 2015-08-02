class AddColumnDefault < ActiveRecord::Migration
  def change
    change_column_default(:movies, :votes, :default => 0)
    change_column_default(:books, :votes, :default => 0)
    change_column_default(:albums, :votes, :default => 0)
  end
end

# wrong syntax!!
