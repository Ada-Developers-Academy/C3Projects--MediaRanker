class Book < ActiveRecord::Base
  # Validations ----------------------------------------------------------------
  validates :title, presence: true

  # Scopes ---------------------------------------------------------------------
  scope :best, -> (total) { order('votes DESC').limit(total) }

  def self.upvote(book)
     book.votes += 1
     book.save
  end
end
