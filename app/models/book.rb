class Book < ActiveRecord::Base
  # Validations --------------------------------
  validates :title, presence: true

  # Scope --------------------------------------
  scope :rank_order, -> { order(rank: :desc)}
  scope :rank_order_top_ten, -> { order(rank: :desc).limit(10)}
end
