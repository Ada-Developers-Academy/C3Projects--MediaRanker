class Movie < ActiveRecord::Base
  # Validations --------------------------------
  validates :title, presence: true
end
