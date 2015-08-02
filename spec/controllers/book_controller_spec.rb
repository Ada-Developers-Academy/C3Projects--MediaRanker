require 'rails_helper'

RSpec.describe BooksController, type: :controller do
  describe BooksController do
    let (:model) { Book }

    it_behaves_like "a media"
  end


  describe "PATCH update" do
    before :each do
      @book1 = Book.new(id: 1, name: "any old name")
      @book1.save
    end

    it "updates an existing record" do
        original_name = @book1.name
        patch :update, id: @book1.id, book: { id: 1, name: "A new name" }
        @book1.reload


        expect(@book1.name).to_not eq original_name
    end
  end
end
