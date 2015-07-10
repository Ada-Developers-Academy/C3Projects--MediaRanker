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

  # TODO: haven't added tests for these
  def self.all_objects(info_source)
    if info_source.is_a?(String)
      all_objects_from_url(info_source)
    end
  end

  private
    def self.all_objects_from_url(url)
      if url.include?("movie")
        Medium.movies
      elsif url.include?("book")
        Medium.books
      elsif url.include?("album")
        Medium.albums
      else
        # TODO: something
      end
    end
end
