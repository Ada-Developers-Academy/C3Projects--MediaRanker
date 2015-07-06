class Album < ActiveRecord::Base
  scope :best, -> (total) { order('votes DESC').limit(total) }
end
