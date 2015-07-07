require 'rails_helper'

RSpec.describe Medium, type: :model do

  describe "ranks media (books) accordingly" do
    it "ranks media based on their ranking" do
      book1 = Medium.create!(ranking: "4", name: "ordered book", media_type: "book")
      book2 = Medium.create!(ranking: "10", name: "ordered book 2", media_type: "book")
      book3 = Medium.create!(ranking: "3", name: "ordered book 3", media_type: "book")

      correct_order = [book2, book1, book3]
      expect(Medium.books.top(10)).to eq correct_order
    end
  end

end
