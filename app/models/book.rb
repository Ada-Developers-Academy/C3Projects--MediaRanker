class Book < ActiveRecord::Base
  # Validations ----------------------------------------------------------------
  validates :title, :author, :description, presence: true
  validates :rank, numericality: { only_integer: true }

  # Scopes ---------------------------------------------------------------------
  def creator
    author
  end
end
