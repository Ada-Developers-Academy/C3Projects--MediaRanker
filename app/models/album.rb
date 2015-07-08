class Album < ActiveRecord::Base

# Validations ---------------------------------
validates :title, presence: true
validates :author, presence: true
validates :ranking, presence: true, numericality: {only_integer: true}

  def validate_or_msg
    errors[:title] = "Every album needs a title ya silly"
    errors[:author] = "Well someone created it, right?"
  end
# Scopes --------------------------------------
end
