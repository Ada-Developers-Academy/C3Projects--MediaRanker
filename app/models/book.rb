class Book < ActiveRecord::Base
  # Validations ---------------------------------
    validates :title, presence: {message: "Every book has a title ya silly!"}
    validates :author, presence: {message: "But who wrote it??"}
    validates :ranking, presence: true, numericality: {only_integer: true}

end
