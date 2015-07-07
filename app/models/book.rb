class Book < ActiveRecord::Base

  # Validations ----------------------------------------------------------------
  validates :name, presence: true


end
