class Book < ActiveRecord::Base
  # Associations------------------------------------------

  # Validations-------------------------------------------
  validates :name, presence: true
  validates :author, presence: true
  validates :description, presence: true
  #  Scopes-----------------------------------------------
  scope :best, -> (total) {order('vote DESC').limit(total)}
end
