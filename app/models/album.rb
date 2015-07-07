class Album < ActiveRecord::Base
  scope :best, -> { order('ranking DESC').limit(10) }
end
