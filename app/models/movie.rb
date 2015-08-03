class Movie < ActiveRecord::Base
  # Associations ---------------------------------------------------------------

   # Validations ----------------------------------------------------------------
  validates :name, presence: true, uniqueness: true

   # Scopes ---------------------------------------------------------------------
  scope :top, -> { ordered.limit(5) }
  scope :ordered, -> { order('rank DESC') }

  def self.upvote(movie)
    movie.rank += 1
    movie.save
  end
end
