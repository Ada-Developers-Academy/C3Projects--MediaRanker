class Medium < ActiveRecord::Base
  # # sets the only allowed types (categories)
  # type_regex = /(^Book$)|(^Movie$)|(^Album$)/
  #
  # # sets the fancy words for each category
  # CATEGORIES = {
  #   books: { creator_noun: "Author", created: "Written" },
  #   movies: { creator_noun: "Director", created: "Directed" },
  #   albums: { creator_noun: "Artist", created: "Produced" },
  # }

  validates :title, presence: true
  validates :type, presence: true, format: { with: type_regex }
  validates :upvotes, presence: true, numericality: { only_integer: true }

  # def plural_category
  #   category.downcase.pluralize
  # end
  #
  # def self.grab_category(category)
  #   self.where(category: category).order("upvotes DESC")
  # end
  #
  # def self.categorize
  #   all_records = []
  #
  #   CATEGORIES.each do |category, _value|
  #     first_ten_records = self.where(category: category.to_s.classify).order("upvotes DESC").limit(10)
  #     all_records.push(first_ten_records) if first_ten_records.length > 0
  #   end
  #
  #   all_records
  # end
end
