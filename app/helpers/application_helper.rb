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

  def form_title_action
    ["new", "create"].include?(action_name) ? "New" : "Edit"
  end

  def capital_plural_resource
    controller_name.capitalize
  end

  def capital_singular_resource
    capital_plural_resource[0..-2]
  end

  def form_title
    "#{form_title_action} #{capital_singular_resource}"
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
end
