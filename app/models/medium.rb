class Medium < ActiveRecord::Base
  validates :name, presence: true

  scope :top, -> { order(rank: :desc).limit(10) }

  def add_a_vote
    self.rank += 1
  end
end
