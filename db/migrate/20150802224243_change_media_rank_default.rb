class ChangeMediaRankDefault < ActiveRecord::Migration
  def change
    change_column_default :media, :rank, 0
  end
end
