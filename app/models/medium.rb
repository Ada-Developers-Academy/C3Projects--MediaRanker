class Medium < ActiveRecord::Base
  scope :movies, -> { where(format: "movie") }
  scope :books, -> { where(format: "book") }
  scope :albums, -> { where(format: "album") }

  scope :best, -> (total) { order('votes DESC').limit(total) }
  scope :best_movies, -> (total) { movies.order('votes DESC').limit(total) }
  scope :best_books, -> (total) { books.order('votes DESC').limit(total) }
  scope :best_albums, -> (total) { albums.order('votes DESC').limit(total) }

  validates :title, presence: true
  validates :format, presence: true

  def self.upvote(object)
     object.votes += 1
     object.save
  end

  def movie?
    format == "movie"
  end

  def book?
    format == "book"
  end

  def album?
    format == "album"
  end
end
