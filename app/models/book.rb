class Book < ActiveRecord::Base
  # Validations -------------
  validates :title, presence: true,
                    length: { minimum: 1 }
  validates :rank,  presence: true,
                    numericality: { only_integer: true }

  # Scopes -------------
  scope :top, -> { order(rank: :desc).limit(5) }
  scope :rank_order, -> { order(rank: :desc) }

  # Callbacks ------------
  before_validation :set_rank

  def set_rank
    self.rank = 0 if rank == nil
  end

  def self.upvote_medium(book)
    book.rank += 1
    book.save
    return book
  end

end
