class Album < ActiveRecord::Base
  # Validations ----------------------------------------------------------------
  validates :title, :artist, :description, presence: true
  validates :rank, numericality: { only_integer: true }

  # Scopes ---------------------------------------------------------------------

  def creator
    artist
  end
end
