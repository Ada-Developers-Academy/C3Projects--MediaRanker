class Medium < ActiveRecord::Base
  # sets the only allowed types (categories)
  type_regex = /(^Book$)|(^Movie$)|(^Album$)/

  validates :title, presence: true
  validates :category, presence: true, format: { with: type_regex }
  validates :upvotes, presence: true, numericality: { only_integer: true }

  # sets the fancy words for each category
  CATEGORIES = [
    books: { name: "Book", plural: "books", creator_noun: "Author", created: "Written" },
    movies: { name: "Movie", plural: "movies", creator_noun: "Director", created: "Directed" },
    albums: { name: "Album", plural: "albums", creator_noun: "Artist", created: "Produced" }
  ]

  CATEGORIES.each do |category_hash|
    category_hash.each do |category, inner_hash|
      # scope :available_formats, -> { select(:format).distinct.order(:format).pluck(:format) }
      scope category, -> { where(category: inner_hash[:name]) }
    end
  end

  def plural_category
    category.downcase.pluralize
  end

  def creator_noun
    return CATEGORIES[plural_category.to_sym][:creator_noun]
  end

  def created
    return CATEGORIES[plural_category.to_sym][:created]
  end

  def self.grab_category(category)
    self.category.order("upvotes DESC")
  end

  def self.categorize
    all_records = []

    CATEGORIES.each do |category_hash|
      category_hash.each do |category, inner_hash|
        first_ten_records = self.grab_category(inner_hash[:plural]).limit(10)
        all_records.push(first_ten_records) if first_ten_records.length > 0
      end
    end

    all_records
  end
end
