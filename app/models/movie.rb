class Movie < ActiveRecord::Base
# Validations ________________________________________________________________
  validates :name, presence: true

# Scope_
  scope :best, -> { order('ranking DESC').limit(10) }
end
