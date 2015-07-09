class Medium < ActiveRecord::Base
  belongs_to :category

  validates :title, presence: true
  validates :upvotes, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :category_id, presence: true, numericality: { only_integer: true, greater_than: 0 }

  scope :by_upvotes, -> { order("upvotes DESC") }
  scope :only_ten, -> { limit(10) }

  def created_by # eg, Created by Quentin Tarantino
    return "#{ category.created_verb } by #{ creator }" if (creator != "" && creator)
  end

  def creator_phrase # eg, Quentin Tarantino's Inglorious Basterds
    return creator ? "#{ creator }'s #{ title }" : "#{ title }"
  end

  def url_base
    "/#{ category.plural }"
  end

  def url
    "#{ url_base }/#{ id }"
  end

  # I've done it this way to account for categories that have no records.
  # I'd love some feedback about better ways to do this or how to improve this.
  def self.categorize
    categories = Category.all.map { |cat| cat.id }

    categorized = []
    categories.each do |cat|
      media = Category.find(cat).media.by_upvotes.only_ten
      categorized.push(media) if media.length > 0
    end

    categorized.sort_by { |cat| cat.length }
  end
end
