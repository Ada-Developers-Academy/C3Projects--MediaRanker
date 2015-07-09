class Book < ActiveRecord::Base

  validates :name, presence: true

  scope :ranking, -> (total) { order("rank DESC").limit(total) }

  def add_vote
    self.rank += 1
  end

end
