class Book < ActiveRecord::Base

  validates :name, presence: true
  # validates :author
  # validates :description
  validates :rank, presence: true, numericality: { only_integer: true }

  scope :best_first, -> (total) { all.order('rank DESC').limit(total) }
  scope :best_first_all, -> { all.order('rank DESC') }

end
