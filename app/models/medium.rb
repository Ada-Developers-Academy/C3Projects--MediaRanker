class Medium < ActiveRecord::Base
  # sets the only allowed types (categories)
  type_regex = /(^Book$)|(^Movie$)|(^Album$)/

  # sets the fancy words for each category
  CATEGORIES = {
    books: { name: "Book", plural: "books", creator_noun: "Author", created: "Written" },
    movies: { name: "Movie", plural: "movies", creator_noun: "Director", created: "Directed" },
    albums: { name: "Album", plural: "albums", creator_noun: "Artist", created: "Produced" }
  }
      # scope category, -> { where(category: inner_hash[:name]) }
  validates :title, presence: true
  validates :category, presence: true, format: { with: type_regex }
  validates :upvotes, presence: true, numericality: { only_integer: true }

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
    self.where(category: category).order("upvotes DESC")
  end

  def self.categorize
    all_records = []

    CATEGORIES.each do |category, _value|
      first_ten_records = self.where(category: category.to_s.classify).order("upvotes DESC").limit(10)
      all_records.push(first_ten_records) if first_ten_records.length > 0
    end

    all_records
  end
end
