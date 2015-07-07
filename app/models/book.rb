class Book < ActiveRecord::Base
  scope :best, -> (total) { order("vote DESC").limit(total) }
end
