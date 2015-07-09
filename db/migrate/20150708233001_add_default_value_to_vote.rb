class AddDefaultValueToVote < ActiveRecord::Migration
  def change
    change_column_default :books,  :vote, 0
    change_column_default :movies, :vote, 0
    change_column_default :albums, :vote, 0
  end
end
