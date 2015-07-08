class Album < ActiveRecord::Base
  #Validations---
  validates :title, presence: true
end
