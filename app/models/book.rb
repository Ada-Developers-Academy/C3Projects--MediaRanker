class Book < ActiveRecord::Base
  # Associations ---------------------------------------------------------------

   # Validations ----------------------------------------------------------------
   validates :name, presence: true
   validates :author, presence: true
   validates :description, presence: true
   validates :rank, presence: true

   # Scopes ---------------------------------------------------------------------
  #  scope :on, -> (label) { where(label: label) }
  #  scope :available_formats, -> { select(:format).distinct.order(:format).pluck(:format) }


end
