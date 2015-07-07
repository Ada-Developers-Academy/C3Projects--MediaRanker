class Album < ActiveRecord::Base

  validates :name, presence: true
  validates :artist, presence: true

  scope :ranking, -> (total) { order("rank DESC").limit(total) }

end
