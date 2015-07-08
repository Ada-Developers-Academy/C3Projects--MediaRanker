class Movie < ActiveRecord::Base

  before_save :default_votes

  def default_votes
    if self.votes.nil?
      self.votes = 0
    end
  end

  # def add_vote
  #   movie = Movie.find()
  # end

end
