class Album < ActiveRecord::Base
  validates :name, prescence: true

  scope :top, -> (number) { order('ranking DESC').limit(number) }
end
