class Movie < ActiveRecord::Base

  scope :best, -> (total) { order(:votes).limit(total) }
end
