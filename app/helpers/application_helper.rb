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
end
