class Medium < ActiveRecord::Base
  before_save :default_votes

  validates :name, presence: true, uniqueness: true
  validates :description, presence: true
  validates :creator, presence: true

  #when a new media is created it sets votes to 0
  def default_votes
    if self.votes.nil?
      self.votes = 0
    end
  end

  #sorts the media with the most votes first. 
  def self.sort_votes(collection)
    collection.to_a.sort_by { |media| media.votes }.reverse
  end

  def find_medium(id)
    Medium.find(id)
  end

  def self.find_books
    self.where(format: "book")
  end

  def self.find_movies
    where(format: "movie")
  end

  def self.find_albums
    where(format: "album")
  end

  #picks an index path to redirect_to for the create and destory action.
  #I had to pass in format for the parameter, because I needed to save the 
  #format type before deleting the instance of media.
  def self.pick_index_path(format)
    if format == "book"
      Rails.application.routes.url_helpers.book_index_path
    elsif format == "album"
      Rails.application.routes.url_helpers.album_index_path
    else
      Rails.application.routes.url_helpers.movie_index_path
    end
  end

  # picks a path to redirect to the show page
  def self.pick_path(media)
    if media.format == "book"
      Rails.application.routes.url_helpers.book_path(media.id)
    elsif media.format == "album"
      Rails.application.routes.url_helpers.album_path(media.id)
    else
      Rails.application.routes.url_helpers.movie_path(media.id)
    end
  end

  def self.pick_edit_path(media)
    if media.format == "book"
      Rails.application.routes.url_helpers.edit_book_path(media.id)
    elsif media.format == "album"
      Rails.application.routes.url_helpers.edit_album_path(media.id)
    else
      Rails.application.routes.url_helpers.edit_movie_path(media.id)
    end
  end

end
