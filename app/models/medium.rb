class Medium < ActiveRecord::Base
  belongs_to :category

  validates :title, presence: true
  validates :upvotes, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :category_id, presence: true, numericality: { only_integer: true, greater_than: 0 }

  scope :by_upvotes, -> { order("upvotes DESC") }
  scope :only_ten, -> { limit(10) }

  def self.categorize
    categorized = []

    categories = Category.all

    categories.each do |category|
      top_ten_from_category = category.media.by_upvotes.only_ten
      categorized.push(top_ten_from_category) if top_ten_from_category.length > 0
    end

    categorized.sort_by { |category| category.length }
  end
end
