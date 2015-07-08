class Book < ActiveRecord::Base

  scope :by_rank, ->  { order("rank DESC") }
  scope :top, -> (total) { by_rank.limit(total) }



  # Validations ----------------------------------------------------------------
  validates :name, presence: true


end
