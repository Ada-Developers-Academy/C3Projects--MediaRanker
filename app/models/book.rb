class Book < ActiveRecord::Base

  validates :name, presence: true
  # validates :author
  # validates :description
  validates :rank, presence: true, numericality: { only_integer: true }

  scope :best_first_all, -> { order('rank DESC') }
  scope :best_first, -> (total) { best_first_all.limit(total) }

  before_validation :set_rank

  def set_rank
    self.rank = 0 if rank.nil?
  end
end
