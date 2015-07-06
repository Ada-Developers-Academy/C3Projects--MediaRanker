class Medium < ActiveRecord::Base
  # Validations ----------------------------------------------------------------
  validates :title, :creator, :description, :format, presence: true
  validates :rank, numericality: { only_integer: true }
  validates :format, inclusion: { in: %w(movie book album),
    message: "%{value} is not a valid media format" }

  # Scopes ---------------------------------------------------------------------
end
