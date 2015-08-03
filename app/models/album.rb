class Album < ActiveRecord::Base
  # Associations ---------------------------------------------------------------

   # Validations ----------------------------------------------------------------
  validates :name, presence: true, uniqueness: true

   # Scopes ---------------------------------------------------------------------

  scope :top, -> { order('rank DESC').limit(5) }
  scope :ordered, -> { order('rank DESC') }
  
  def self.upvote(album)
    album.rank += 1
    album.save
  end
end
