class Movie < ActiveRecord::Base
  TYPE = "Movie"

# VALIDATIONS ------------------------------------------------------------------
  validates :title, presence: true, uniqueness: true

# SCOPES -----------------------------------------------------------------------
  scope :top_rank, -> (number_limit){ order('ranking DESC').limit(number_limit) }
  scope :descending_rank, -> { order('ranking DESC') }

# METHODS ----------------------------------------------------------------------
  def self.upvote(movie)
    movie.ranking += 1
    movie.save
  end
end
