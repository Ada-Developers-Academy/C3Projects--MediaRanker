class Book < ActiveRecord::Base
  scope :best, -> (total) { order('votes DESC').limit(total) }

  validates :title, presence: true

  def self.upvote(book)
     book.votes += 1
     book.save
  end
end
