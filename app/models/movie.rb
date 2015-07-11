class Movie < ActiveRecord::Base
  # Associations------------------------------------------

  # Validations-------------------------------------------
  validates :name, presence: true
  validates :director, presence: true
  validates :description, presence: true
            
  #  Scopes-----------------------------------------------
  scope :best, -> (total) {order('vote DESC').limit(total)}

end


