class Book < ActiveRecord::Base
  # Associations ---------------------------------------------------------------

   # Validations ----------------------------------------------------------------
  validates :name, presence: true

   # Scopes ---------------------------------------------------------------------

  scope :top, -> { order('rank DESC').limit(5) }
  scope :ordered, -> { order('rank DESC') }
  #  scope :on, -> (label) { where(label: label) }
  #  scope :available_formats, -> { select(:format).distinct.order(:format).pluck(:format) }


end
