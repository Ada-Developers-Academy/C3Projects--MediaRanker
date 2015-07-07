class Medium < ActiveRecord::Base
  # sets the only allowed types
  type_regex = /(^Book$)|(^Movie$)|(^Album$)/

  validates :title, presence: true
  validates :category, presence: true, format: { with: type_regex }
  validates :upvotes, presence: true, numericality: { only_integer: true }

  def self.categorize
    all_records = self.all
    all_records.group_by { |record| record.category }
  end

  def self.select_category(category)
    all_records = self.all
    all_records.select(category: category)
  end
end
