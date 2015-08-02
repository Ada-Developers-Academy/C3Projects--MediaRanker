module ApplicationHelper
  def creator
    case controller_name
      when "albums"
        "Artist"
      when "books"
        "Author"
      when "movies"
        "Director"
    end
  end

  def medium
    case controller_name
      when "albums"
        @album
      when "books"
        @book
      when "movies"
        @movie
    end
  end
end
