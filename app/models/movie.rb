class Movie < ActiveRecord::Base
  belongs_to :user

# Validations!

# Scopes!
  scope :best, -> { order('rank DESC').limit(10) }

end
