class Album < ActiveRecord::Base
 # Associations!
  belongs_to :user

# Validations!
  validates :name, presence: true
  validates :rank, presence: true,
            numericality: { only_integer: true, less_than: 200 }

# Scopes!
  scope :order_asc, -> { order('rank ASC') }

  scope :best, -> { order('rank DESC').limit(10) }
end
