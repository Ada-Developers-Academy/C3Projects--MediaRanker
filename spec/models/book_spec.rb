require 'rails_helper'

RSpec.describe Book, type: :model do 

  describe "model validations" do
    it "requires a name, description, and author all the time" do
      book = Book.new

      expect(book).to_not be_valid
      expect(book.errors.keys).to include(:name,:description,:author)
    end
  end
end