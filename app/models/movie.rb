class Movie < ActiveRecord::Base
  # Validations ----------------------------------------------------------------
  validates :title, presence: true
  validates :rank, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  # Scopes ---------------------------------------------------------------------
  scope :ranked,      -> { order(rank: :desc) }
  scope :top_ranked,  -> { ranked.limit(10) }

  def add_vote
    update(rank: self.rank + 1)
  end
end
