require 'rails_helper'

RSpec.describe Book, type: :model do
  describe "model validation" do
    it "requires a name, all the time" do
        book = Book.new

        expect(book).to_not be_valid 
        expect(book.errors.keys).to include(:name)
    end

    it "requires a description, all the time" do
        book = Book.new

        expect(book).to_not be_valid 
        expect(book.errors.keys).to include(:description)
    end 
  end
end
