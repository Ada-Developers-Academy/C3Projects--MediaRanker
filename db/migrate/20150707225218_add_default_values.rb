class AddDefaultValues < ActiveRecord::Migration
  def change
    change_column_default :albums, :ranking, 1
    change_column_default :books, :ranking, 1
    change_column_default :movies, :ranking, 1
  end
end
