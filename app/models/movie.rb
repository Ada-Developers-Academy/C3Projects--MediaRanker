class Movie < ActiveRecord::Base
  scope :best, -> (total) { order('votes DESC').limit(total) }

  def self.upvote(movie)
     movie.votes += 1
     movie.save
  end
end
