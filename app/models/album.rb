class Album < ActiveRecord::Base

  scope :ranking, -> { order("rank DESC").limit(5) }

end
