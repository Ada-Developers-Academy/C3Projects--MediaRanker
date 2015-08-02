class Book < ActiveRecord::Base
  TYPE = "Book"

# VALIDATIONS ------------------------------------------------------------------
  validates :title, presence: true, uniqueness: true

# SCOPES -----------------------------------------------------------------------
  scope :top_rank, -> (number_limit){ order('ranking DESC').limit(number_limit) }
  scope :descending_rank, -> { order('ranking DESC') }

# METHODS ----------------------------------------------------------------------
  def self.upvote(book)
    book.ranking += 1
    book.save
  end
end
