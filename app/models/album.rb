class Album < ActiveRecord::Base
 # Associations!
  belongs_to :user

# Validations!
  validates :name, presence: true, uniqueness: true
  validates :rank, presence: true,
            numericality: { only_integer: true, less_than: 200 }


# Scopes!
  scope :best, -> { order('rank DESC').limit(10) }
end
