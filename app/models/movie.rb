class Movie < ActiveRecord::Base
  # Associations------------------------------------------

  # Validations-------------------------------------------
  validates :name, presence: true
  validates :director, presence: true
  validates :description, presence: true
  validates :vote, presence: true
            

  #  Scopes-----------------------------------------------


end


