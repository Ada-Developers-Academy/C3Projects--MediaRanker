class Movie < ActiveRecord::Base
  # Validations ----------------------------------------------------------------
  validates :title, presence: true

  # Scopes ---------------------------------------------------------------------
  scope :best, -> (total) { order('votes DESC').limit(total) }

  # Class Methods --------------------------------------------------------------
  def self.upvote(movie)
    puts movie.inspect
     movie.votes += 1
     movie.save
     puts movie.inspect
  end
end
