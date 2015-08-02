class Album < ActiveRecord::Base
  # Scopes
  scope :best, -> (total) { order('rank DESC').limit(total)}
  
  # Validations
  validates :name, presence: true
  validates :description, presence: true

  after_initialize :default_rank

  def default_rank
    self.rank ||= 0
  end
end
