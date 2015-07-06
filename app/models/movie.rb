class Movie < ActiveRecord::Base
  scope :top_5, -> { order('ranking DESC').limit(5) }
end
