class Album < ActiveRecord::Base
  TYPE = "Album"

# VALIDATIONS ------------------------------------------------------------------
  validates :title, presence: true, uniqueness: true

# SCOPES -----------------------------------------------------------------------
  scope :top_rank, -> (number_limit){ order('ranking DESC').limit(number_limit) }
  scope :descending_rank, -> { order('ranking DESC') }

# METHODS ----------------------------------------------------------------------
  def self.upvote(album)
    album.ranking += 1
    album.save
  end
end
