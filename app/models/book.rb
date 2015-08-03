class Book < ActiveRecord::Base

  validates :name, presence: true
  # validates :author
  # validates :description
  validates :rank, presence: true, numericality: { only_integer: true }

  scope :best_first, -> (total) { order('rank DESC').limit(total) }
  scope :best_first_all, -> { order('rank DESC') }

  before_validation :set_rank

  def set_rank
    self.rank = 0 if rank.nil?
  end
end
