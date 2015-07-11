class Album < ActiveRecord::Base

# Associations------------------------------------------

# Validations-------------------------------------------
  validates :name, presence: true
  validates :artist, presence: true
  validates :description, presence: true

#  Scopes-----------------------------------------------
  scope :best, -> (total) {order('vote DESC').limit(total)}

end
