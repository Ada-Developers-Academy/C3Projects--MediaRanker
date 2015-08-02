class Movie < ActiveRecord::Base
  validates :name, presence: true
  validates :rank, numericality: { only_integer: true }

  scope :top, -> { order(rank: :desc).limit(3) }
end
