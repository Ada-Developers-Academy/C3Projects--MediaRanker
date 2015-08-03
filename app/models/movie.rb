class Movie < ActiveRecord::Base
  validates :name, presence: true
  validates :rank, numericality: { only_integer: true }

  scope :ranked, -> { order(rank: :desc) }

  def self.top(top_limit)
    order(rank: :desc).limit(top_limit)
  end
end
