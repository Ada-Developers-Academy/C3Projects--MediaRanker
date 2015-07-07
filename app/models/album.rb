class Album < ActiveRecord::Base
  # Associations ---------------------------------------------------------------

   # Validations ----------------------------------------------------------------
   validates :name, presence: true
   validates :artist, presence: true
   validates :description, presence: true
   validates :rank, presence: true

   # Scopes ---------------------------------------------------------------------
  #  scope :on, -> (label) { where(label: label) }
  #  scope :available_formats, -> { select(:format).distinct.order(:format).pluck(:format) }


end
