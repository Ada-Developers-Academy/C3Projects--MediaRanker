class Book < ActiveRecord::Base
  # Validations ----------------------------------------------------------------
  validates :title, :author, :description, presence: true
  validates :rank, numericality: { only_integer: true }

  # Scopes ---------------------------------------------------------------------
  scope :all_ranked, -> { all.order(rank: :desc) }

  def creator
    author
  end

  def add_vote
    old_value = self.rank
    update(rank: old_value + 1)
  end
end
