class VideoGame < ActiveRecord::Base
  validates :title, presence: true, uniqueness: true

  scope :ordered_by_rating, -> { order('video_games.rating DESC') }
end
