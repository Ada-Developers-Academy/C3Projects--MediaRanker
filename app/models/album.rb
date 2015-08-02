class Album < ActiveRecord::Base
  scope :by_rank, ->  { order("rank DESC") }
  scope :top, -> (total) { by_rank.limit(total) }

  # Validations ----------------------------------------------------------------
  validates :name, presence: true

  def vote
    self.rank.increment!
    self.save
  end
end
