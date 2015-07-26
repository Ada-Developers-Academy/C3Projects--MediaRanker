class Album < ActiveRecord::Base
  validates :title, presence: true, uniqueness: true

  scope :top_5, -> { order('ranking DESC').limit(5) }
  scope :descending_rank, -> { order('ranking DESC') }
end
