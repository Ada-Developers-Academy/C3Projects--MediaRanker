require 'rails_helper'

RSpec.describe Book, type: :model do
  describe "model validation" do
    it "Requires that a name must be entered to create an entry" do
      book=Book.new

      expect(book).to_not be_valid
      expect(book.errors.keys).to include(:title)
    end
  end
end
