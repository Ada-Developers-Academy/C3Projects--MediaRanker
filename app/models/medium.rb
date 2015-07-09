class Medium < ActiveRecord::Base
  belongs_to :category

  validates :title, presence: true
  validates :upvotes, presence: true, numericality: { only_integer: true }
  validates :category_id, presence: true, numericality: { only_integer: true }

  scope :by_upvotes, -> { order("upvotes DESC") }
  scope :top_ten, -> { limit(10) }

  def created_by # eg, Created by Quentin Tarantino
    return "#{ category.created_verb } by #{ creator }" if creator
  end

  def creator_phrase # eg, Quentin Tarantino's Inglorious Basterds
    return creator ? "#{ creator }'s #{ title }" : "#{ title }"
  end
end
