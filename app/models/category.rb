class Category < ActiveRecord::Base
  has_many :media

  validates :name, presence: true, uniqueness: true
  validates :creator_noun, presence: true
  validates :created_verb, presence: true

  def plural
    name.downcase.pluralize
  end

  def display_name
    full_name || name
  end
end
