class Movie < ActiveRecord::Base

  validates :name, presence: true
  validates :director, presence: true


  scope :ranking, -> { order("rank DESC").limit(5) }
end
