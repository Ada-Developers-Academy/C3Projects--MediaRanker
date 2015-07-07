class Album < ActiveRecord::Base

  # Validations ----------------------------------------------------------------
  validates :name, presence: true, uniqueness: true

  # Scopes ----------------------------------------------------------------------
  scope :best, -> (total) { order("vote DESC").limit(total) }
end
