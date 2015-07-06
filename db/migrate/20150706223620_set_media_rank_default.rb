class SetMediaRankDefault < ActiveRecord::Migration
  def change
    change_column :media, :rank, :integer, default: 0
  end
end
