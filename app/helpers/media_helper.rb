module MediaHelper
  def object_path(obj)
    case obj.format
    when "movie"
      movie_path(obj)
    when "book"
      book_path(obj)
    when "album"
      album_path(obj)
    end
  end

  def new_object_path(obj)
    case obj.format
    when "movie"
      new_movie_path
    when "book"
      new_book_path
    when "album"
      new_album_path
    end
  end

  def edit_object_path(obj)
    case obj.format
    when "movie"
      edit_movie_path(obj)
    when "book"
      edit_book_path(obj)
    when "album"
      edit_album_path(obj)
    end
  end

  # TODO: check if I use this anywhere
  def objects_path(obj)
    case obj.format
    when "movie"
      movies_path
    when "book"
      books_path
    when "album"
      albums_path
    end
  end
end
