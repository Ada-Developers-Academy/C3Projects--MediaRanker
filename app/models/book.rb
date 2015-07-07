class Book < ActiveRecord::Base
  scope :best, -> (total) { order('votes DESC').limit(total) }

  def self.upvote(book)
     book.votes += 1
     book.save
  end
end
