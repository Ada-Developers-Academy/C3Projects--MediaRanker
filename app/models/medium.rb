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

  def self.pick_index_path(media)
    if media.format == "book"
      Rails.application.routes.url_helpers.book_index_path
    elsif media.format == "album"
      Rails.application.routes.url_helpers.album_index_path
    else
      Rails.application.routes.url_helpers.movie_index_path
    end
  end
end
