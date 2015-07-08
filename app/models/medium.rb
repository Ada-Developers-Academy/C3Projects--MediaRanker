class Medium < ActiveRecord::Base
  # sets the only allowed types
  type_regex = /(^Book$)|(^Movie$)|(^Album$)/

  validates :title, presence: true
  validates :category, presence: true, format: { with: type_regex }
  validates :upvotes, presence: true, numericality: { only_integer: true }

  def plural_category
    category.downcase.pluralize
  end

  def creator
    return "Author" if category == "Book"
    return "Director" if category == "Movie"
    return "Artist" if category == "Album"
  end

  def created
    return "Written" if category == "Book"
    return "Directed" if category == "Movie"
    return "Produced" if category == "Album"
  end

  def self.grab_category(category)
    self.where(category: category)
  end

  def self.categorize
    all_records = self.all
    all_records.group_by { |record| record.category }
  end
end
