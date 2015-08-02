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

  def created
    case controller_name
      when "albums"
        "Recorded"
      when "books"
        "Written"
      when "movies"
        "Directed"
    end
  end

  def article
    controller_name == "albums" ? "an" : "a"
  end

  def medium_symbol
    case controller_name
      when "albums"
        :album
      when "books"
        :book
      when "movies"
        :movie
    end
  end

  def form_title_action
    action_name == "new" ? "New" : "Edit"
  end
end
