class Medium < ActiveRecord::Base
  # sets the only allowed types
  type_regex = /(^Book$)|(^Movie$)|(^Album$)/

  validates :title, presence: true
  validates :type, presence: true, format: { with: type_regex }
  validates :upvotes, presence: true, numericality: { only_integer: true }
end
