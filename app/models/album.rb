class Album < ActiveRecord::Base


  # Validations ----------------------------------------------------------------
  validates :name, presence: true


end
