class Album < ActiveRecord::Base
  scope :best, -> (total) { order('votes DESC').limit(total) }

  def self.upvote(album)
     album.votes += 1
     album.save
  end
end
