class Book < ActiveRecord::Base

  validates :name, presence: true
  validates :author, presence: true

  scope :ranking, -> { order("rank DESC").limit(5) }

end
