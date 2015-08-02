class Book < ActiveRecord::Base

  validates :name, presence: true, uniqueness: true

  scope :ranking, -> (total) { order("rank DESC").limit(total) }

  def add_vote
    self.rank += 1
  end

end
