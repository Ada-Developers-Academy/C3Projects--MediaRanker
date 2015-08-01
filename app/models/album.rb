class Album < ActiveRecord::Base
  # Validations ________________________________________________________________
  validates :name, presence: true

  # Scope_______________________________________________________________________
  scope :desc_order, -> { order('ranking DESC') }
end
