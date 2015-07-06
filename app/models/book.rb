class Book < ActiveRecord::Base
  validates :name, presence: true

  scope :top, -> { order(rank: :desc).limit(10) }

end
