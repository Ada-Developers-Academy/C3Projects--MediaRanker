class Medium < ActiveRecord::Base
  validates :name, presence: true

  scope :top, -> { order(rank: :desc).limit(10) }

  def add_a_vote
    self.rank += 1
  end

  def find_all_media
    @all_media = self.all.order(rank :desc)
  end

  def find_media
    # find a specific instance based on params
    @media = self.find(params[:id])
  end

  def create_medium
    # medium is the new instance
    @medium = self.new
  end
end
