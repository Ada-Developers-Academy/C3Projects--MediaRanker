class Movie < ActiveRecord::Base
  TYPE = "Movie"

  validates :title, presence: true, uniqueness: true

  scope :top_rank, -> (number_limit){ order('ranking DESC').limit(number_limit) }
  scope :descending_rank, -> { order('ranking DESC') }
end
