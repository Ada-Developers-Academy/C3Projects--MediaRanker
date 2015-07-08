class Album < ActiveRecord::Base
  # Validations ________________________________________________________________
  validates :name, presence: true

  # Scope_______________________________________________________________________
  scope :best, -> { order('ranking DESC').limit(10) }
end
