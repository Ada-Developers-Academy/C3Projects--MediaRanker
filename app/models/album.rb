class Album < ActiveRecord::Base
  # Validations -------------
  validates :id,    presence: true,
                    numericality: { only_integer: true },
                    uniqueness: true
  validates :title, presence: true,
                    length: { minimum: 1 }
  validates :rank,  presence: true,
                    numericality: { only_integer: true }

  # Scopes -------------
  scope :top, -> { order(rank: :desc).limit(5) }
end
