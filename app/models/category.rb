class Category < ActiveRecord::Base
  has_many :media

  validates :name, presence: true
  validates :creator_noun, presence: true
  validates :created_verb, presence: true

  def url_plural
    name.downcase.pluralize
  end

  def plural
    name.pluralize
  end
end
