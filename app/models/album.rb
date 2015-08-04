class Album < ActiveRecord::Base

# Validations ---------------------------------
  validates :title, presence: {message: "Every album has a title ya silly!"}
  validates :author, presence: {message: "Who dun it tho??"}
  validates :ranking, presence: true, numericality: {only_integer: true}

  # def title_exists
    # errors[:title] = "Every album needs a title ya silly"
    # errors[:author] = "Well someone created it, right?"
  # end
# Scopes --------------------------------------
end
