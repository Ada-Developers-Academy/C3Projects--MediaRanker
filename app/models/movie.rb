class Movie < ActiveRecord::Base
  # Validations --------------------------------
  validates :title, presence: true

  # Scope --------------------------------------
  scope :rank_order, -> { order(rank: :desc)}
  scope :rank_order_top_ten, -> { rank_order.limit(10)}
end
