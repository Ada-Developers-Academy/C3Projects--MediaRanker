class Movie < ActiveRecord::Base

  validates :name, presence: true
  validates :director, presence: true


  scope :ranking, -> (total) { order("rank DESC").limit(total) }
end
