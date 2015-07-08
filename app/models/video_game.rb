class VideoGame < ActiveRecord::Base
  validates :title, presence: true, uniqueness: true

  scope :ordered_by_stars, -> { order('video_games.stars DESC') }
end
