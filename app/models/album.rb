class Album < ActiveRecord::Base

# Associations------------------------------------------

# Validations-------------------------------------------
  validates :name, presence: true
  validates :artist, presence: true
  validates :description, presence: true
  validates :vote, presence: true
 

#  Scopes-----------------------------------------------


end
