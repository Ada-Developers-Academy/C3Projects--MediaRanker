class Movie < ActiveRecord::Base
# Validations ________________________________________________________________
  validates :name, presence: true

# Scope_______________________________________________________________________
  scope :best, -> { order('ranking DESC').limit(10) }
  scope :desc_order, -> { order('ranking DESC') }
end
