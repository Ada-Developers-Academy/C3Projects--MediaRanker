class Movie < ActiveRecord::Base

  # Scopes
  scope :best, -> (total) { order('rank DESC').limit(total)}

  # Validations
  validates :name, presence: true
  validates :description, presence: true
end
