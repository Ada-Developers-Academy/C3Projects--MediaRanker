class Book < ActiveRecord::Base
  # Associations ---------------------------------------------------------------

   # Validations ----------------------------------------------------------------
  validates :name, presence: true, uniqueness: true

   # Scopes ---------------------------------------------------------------------

  scope :top, -> { order('rank DESC').limit(5) }
  scope :ordered, -> { order('rank DESC') }
  #  scope :on, -> (label) { where(label: label) }
  #  scope :available_formats, -> { select(:format).distinct.order(:format).pluck(:format) }

  def self.upvote(book)
    book.rank += 1
    book.save
  end

end
