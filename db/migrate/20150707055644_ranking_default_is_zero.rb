class RankingDefaultIsZero < ActiveRecord::Migration
  def change
    change_column :media, :ranking, :integer, :default => 0
  end
end
