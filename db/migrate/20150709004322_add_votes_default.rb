class AddVotesDefault < ActiveRecord::Migration
  def change
    change_column_default :movies, :votes, 0
    change_column_default :books, :votes, 0
    change_column_default :albums, :votes, 0
  end
end
