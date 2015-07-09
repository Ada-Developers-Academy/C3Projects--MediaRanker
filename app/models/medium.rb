class Medium < ActiveRecord::Base
  scope :best, -> (total) { order('votes DESC').limit(total) }
  scope :best_movies, -> (total) { where(format: "movie").order('votes DESC').limit(total) }
  scope :best_albums, -> (total) { where(format: "album").order('votes DESC').limit(total) }
  scope :best_books, -> (total) { where(format: "book").order('votes DESC').limit(total) }

  validates :title, presence: true
  validates :format, presence: true

  def self.upvote(object)
     object.votes += 1
     object.save
  end
end
