class Movie < ActiveRecord::Base
  # Validations --------------------------------
  validates :title, presence: true

  # Scope --------------------------------------
  scope :rank_order, -> { order(rank: :desc)}
end
