class Album < ActiveRecord::Base
  validates :name, presence: true

  scope :ranking_order, -> { order('ranking DESC') }
  scope :top, -> (number) { order('ranking DESC').limit(number) }
end
