class Movie < ActiveRecord::Base
  # Validations ----------------------------------------------------------------
  validates :title, presence: true
  validates :rank, numericality: { only_integer: true }

  # Scopes ---------------------------------------------------------------------
  scope :ranked,      -> { order(rank: :desc) }
  scope :all_ranked,  -> { all.ranked }
  scope :top_ranked,  -> { all_ranked.limit(10) }

  def add_vote
    old_value = self.rank
    update(rank: old_value + 1)
  end
end
