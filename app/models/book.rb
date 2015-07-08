class Book < ActiveRecord::Base

  # Scope --------------------------------------
  scope :rank_order, -> { order(rank: :desc)}
end
