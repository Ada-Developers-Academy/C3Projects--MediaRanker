class Book < ActiveRecord::Base
  validates :name, presence: true

  scope :top, -> (number) { order('ranking DESC').limit(number) }
end
