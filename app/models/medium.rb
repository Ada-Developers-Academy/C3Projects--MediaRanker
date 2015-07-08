class Medium < ActiveRecord::Base
  before_save :default_votes

  def default_votes
    if self.votes.nil?
      self.votes = 0
    end
  end

  def self.find_books
    where(format: "book")
  end

  def self.find_movies
    where(format: "movie")
  end

  def self.find_albums
    where(format: "album")
  end
end
