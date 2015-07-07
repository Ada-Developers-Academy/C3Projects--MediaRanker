class Album < ActiveRecord::Base
  validates :name, presence: true
  validates :name, :description, uniqueness: true
  validates :rank, numericality: { only_integer: true }

  scope :top, -> { order(rank: :desc).limit(3) }
end
