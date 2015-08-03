class Movie < ActiveRecord::Base
  # Associations ---------------------------------------------------------------

   # Validations ----------------------------------------------------------------
  validates :name, presence: true, uniqueness: true

   # Scopes ---------------------------------------------------------------------
  scope :top, -> { order('rank DESC').limit(5) }
  scope :ordered, -> { order('rank DESC') }

    # scope :desc, order("event_at DESC")
  #  scope :available_formats, -> { select(:format).distinct.order(:format).pluck(:format) }

  def self.upvote(movie)
    movie.rank += 1
    movie.save
  end
end
