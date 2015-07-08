class Movie < ActiveRecord::Base
  # Validations ----------------------------------------------------------------
  validates :title, :director, :description, presence: true
  validates :rank, numericality: { only_integer: true }

  # Scopes ---------------------------------------------------------------------
  def creator
    director
  end

  # def add_vote
  #   rank += 1
  # end
end
