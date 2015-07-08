class Album < ActiveRecord::Base
  # Validations ----------------------------------------------------------------
  validates :title, :artist, :description, presence: true
  validates :rank, numericality: { only_integer: true }

  # Scopes ---------------------------------------------------------------------

  def creator
    artist
  end

  def add_vote
    old_value = self.rank
    update(rank: old_value + 1)
  end
end
