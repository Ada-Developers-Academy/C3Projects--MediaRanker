class Movie < ActiveRecord::Base
  validates :name, :director, :description, :rank, presence: true
  validates :name, :description, uniqueness: true
  validates :rank, numericality: { only_integer: true }
end
