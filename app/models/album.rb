class Album < ActiveRecord::Base
  TOP_NUM = 10

  # Validations --------------------------------
  validates :title, presence: true

  # Scope --------------------------------------
  scope :rank_order, -> { order(rank: :desc)}
  scope :rank_order_top, -> { rank_order.limit(TOP_NUM)}
end
