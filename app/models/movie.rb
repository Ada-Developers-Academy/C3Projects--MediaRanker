class Movie < ActiveRecord::Base

  scope :by_rank, ->  { order("rank DESC") }


  # Validations ----------------------------------------------------------------
  validates :name, presence: true


end
