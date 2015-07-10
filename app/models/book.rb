class Book < ActiveRecord::Base
  validates :title, presence: true, uniqueness: true
  scope :top_5, -> { order('ranking DESC').limit(5) }
end
