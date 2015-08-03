class Medium < ActiveRecord::Base
  MOVIE = "movie"
  BOOK = "book"
  ALBUM = "album"
  ALL_MEDIA = [MOVIE, BOOK, ALBUM]

  scope :movies, -> { where(format: MOVIE) }
  scope :books, -> { where(format: BOOK) }
  scope :albums, -> { where(format: ALBUM) }

  scope :best, -> (total) { order('votes DESC').limit(total) }
  scope :best_movies, -> (total) { movies.best(total) }
  scope :best_books, -> (total) { books.best(total) }
  scope :best_albums, -> (total) { albums.best(total) }

  validates :title, presence: true
  validates :format, presence: true, inclusion: { in: ALL_MEDIA, message: "These are the only allowed formats: #{ALL_MEDIA.join(', ')}." }

  def upvote!
     self.votes += 1
     self.save
  end

  def self.all_objects(format)
    case format
    when MOVIE
      Medium.movies
    when BOOK
      Medium.books
    when ALBUM
      Medium.albums
    else
      Medium.none
    end
  end
end
