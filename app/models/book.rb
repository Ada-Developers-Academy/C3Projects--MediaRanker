class Book < ActiveRecord::Base
  # Associations ---------------------------------------------------------------

   # Validations ----------------------------------------------------------------
  validates :name, presence: true, uniqueness: true

   # Scopes --------------------------------------------------------------------
  scope :top, -> { ordered.limit(5) }
  scope :ordered, -> { order('rank DESC') }

  def self.upvote(book)
    book.rank += 1
    book.save
  end

end
