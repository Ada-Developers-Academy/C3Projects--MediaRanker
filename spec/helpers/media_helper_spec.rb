require 'rails_helper'

RSpec.describe MediaHelper, type: :helper do
  describe "path helpers" do
    let(:movie) { Medium.create({ :title=>"Kitties Movie", :creator=>"Cat", :votes=>9, :format=>"movie" }) }
    let(:book) { Medium.create({ :title=>"Puppies Book", :creator=>"Dog", :votes=>10, :description=>"", :format=>"book" }) }
    let(:album) { Medium.create({ :title=>"Llamas Album", :creator=>"The Llama", :votes=>6, :description=>"", :format=>"album" }) }

    describe "#object_path" do
      it "provides correct path for a movie" do
        expect(object_path(movie)).to eq(movie_path(movie))
      end

      it "provides correct path for a book" do
        expect(object_path(book)).to eq(book_path(book))
      end

      it "provides correct path for an album" do
        expect(object_path(album)).to eq(album_path(album))
      end
    end

    describe "#new_object_path" do
      it "provides correct path for a movie" do
        expect(new_object_path(movie)).to eq(new_movie_path)
      end

      it "provides correct path for a book" do
        expect(new_object_path(book)).to eq(new_book_path)
      end

      it "provides correct path for an album" do
        expect(new_object_path(album)).to eq(new_album_path)
      end
    end
    describe "#edit_object_path" do
      it "provides correct path for a movie" do
        expect(edit_object_path(movie)).to eq(edit_movie_path(movie))
      end

      it "provides correct path for a book" do
        expect(edit_object_path(book)).to eq(edit_book_path(book))
      end

      it "provides correct path for an album" do
        expect(edit_object_path(album)).to eq(edit_album_path(album))
      end
    end
    describe "#objects_path" do
      it "provides correct path for movies" do
        expect(objects_path(movie)).to eq(movies_path)
      end

      it "provides correct path for books" do
        expect(objects_path(book)).to eq(books_path)
      end

      it "provides correct path for albums" do
        expect(objects_path(album)).to eq(albums_path)
      end
    end
  end
end
