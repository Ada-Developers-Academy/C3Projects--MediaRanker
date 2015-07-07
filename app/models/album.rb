class Album < ActiveRecord::Base

  validates :name, presence: true
  validates :artist, presence: true

  scope :ranking, -> { order("rank DESC").limit(5) }

end
