class Album < ActiveRecord::Base
  belongs_to :user

  scope :best, -> { order('rank DESC').limit(10) }
end
