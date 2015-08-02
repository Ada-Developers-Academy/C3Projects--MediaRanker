require 'rails_helper'

RSpec.describe BooksController, type: :controller do
  it_behaves_like "a controller"

  let(:media_params) do
        { book: {
          name: "Rockin Book",
          creator: "Van Halen",
          description: "Book about Rock n Roll" }
        }
  end #let

  let(:missing_params) do
        { book: {

          creator: "Van Halen",
          description: "Book about Rock n Roll" }
        }
  end #let

  let(:media_path) {book_path(Book.last.id)}

  let(:media) {:book}
  let(:medias) {:books}

end
