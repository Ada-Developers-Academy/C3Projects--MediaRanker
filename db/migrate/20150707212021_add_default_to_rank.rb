class AddDefaultToRank < ActiveRecord::Migration
  def change
    change_column_default :movies, :rank, 0
    change_column_default :albums, :rank, 0
    change_column_default :books, :rank, 0
  end
end
