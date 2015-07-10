class Book < ActiveRecord::Base
  # Associations------------------------------------------

  # Validations-------------------------------------------
  validates :name, presence: true
  validates :author, presence: true
  validates :description, presence: true
  validates :vote, presence: true
          


  #  Scopes-----------------------------------------------

end
