class Album < ActiveRecord::Base

# Validations ---------------------------------
validates :title, presence: true
validates :author, presence: true
validates :ranking, presence: true, numericality: {only_integer: true}
# Scopes --------------------------------------
end
