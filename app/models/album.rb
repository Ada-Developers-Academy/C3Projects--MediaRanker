class Album < ActiveRecord::Base
  # Validations ----------------------------------------------------------------
  validates :title, presence: true

  # Scopes ---------------------------------------------------------------------
  scope :best, -> (total) { order('votes DESC').limit(total) }

  # Class Methods --------------------------------------------------------------
  def self.upvote(album)
     album.votes += 1
     album.save
  end
end
