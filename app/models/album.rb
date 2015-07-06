class Album < ActiveRecord::Base
  validates :name, :artist, :description, :rank, presence: true
  validates :name, :description, uniqueness: true
  validates :rank, numericality: { only_integer: true }
end
