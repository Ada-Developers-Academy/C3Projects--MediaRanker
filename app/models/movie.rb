class Movie < ActiveRecord::Base
  # Validations ---------------------------------
    validates :title, presence: {message: "Every movie has a title ya silly!"}
    validates :author, presence: {message: "Do you know who directed it?"}
    validates :ranking, presence: true, numericality: {only_integer: true}

end
