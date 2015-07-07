class Book < ActiveRecord::Base

  validates :name, presence: true
  validates :author, presence: true

  scope :ranking, -> (total) { order("rank DESC").limit(total) }

end
