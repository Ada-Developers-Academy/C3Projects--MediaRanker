class User < ActiveRecord::Base
  has_many :albums
  has_many :movies
  has_many :books


  scope :best, -> { order('rank DESC').limit(10) }
end
