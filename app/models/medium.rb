class Medium < ActiveRecord::Base
  scope :movies, -> { where(format: "movie") }
  scope :books, -> { where(format: "book") }
  scope :albums, -> { where(format: "album") }

  scope :best, -> (total) { order('votes DESC').limit(total) }
  scope :best_movies, -> (total) { movies.order('votes DESC').limit(total) }
  scope :best_books, -> (total) { books.order('votes DESC').limit(total) }
  scope :best_albums, -> (total) { albums.order('votes DESC').limit(total) }

  validates :title, presence: true
  validates :format, presence: true, inclusion: { in: ["movie", "book", "album"], message: "\"book\", \"movie\", and \"album\" are the only allowed formats." }

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

  # TODO: haven't added tests for these
  def self.all_objects(format)
    case format
    when "movie"
      Medium.movies
    when "book"
      Medium.books
    when "album"
      Medium.albums
    else
      Medium.none
    end
  end
end
