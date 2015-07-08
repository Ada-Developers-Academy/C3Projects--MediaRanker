class Movie < ActiveRecord::Base
  # Associations ---------------------------------------------------------------

   # Validations ----------------------------------------------------------------
  validates :name, presence: true


   # Scopes ---------------------------------------------------------------------
  scope :top, -> { order('rank DESC').limit(5) }
    #
    # scope :desc, order("event_at DESC")
  #  scope :available_formats, -> { select(:format).distinct.order(:format).pluck(:format) }

end
