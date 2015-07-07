class Medium < ActiveRecord::Base

  #------ VALIDATIONS ------

  # validates :ranking, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  # validates :name, presence: true
  # validates :contributor, presence: true
  # validates :description, presence: true
  # validates :user, presence: true
  validates :media_type, presence: true, inclusion: { in: %w(movie book album)}


  #------ SCOPES ------

  scope :books, -> { where(media_type: "book")}
  scope :movies, -> { where(media_type: "movie")}
  scope :albums, -> { where(media_type: "album")}


end
