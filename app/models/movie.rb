class Movie < ActiveRecord::Base
  scope :top, -> (number) { order('ranking DESC').limit(number) }
end
