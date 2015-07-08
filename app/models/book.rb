class Book < ActiveRecord::Base

  # Validations
  validates :name, presence: true
  validates :description, presence: true
end
