module ApplicationHelper
  def pick_upvote_path(media)
    "/#{media.format}s/#{media.id}/upvote"
  end

  def pick_delete_path(media)
    if media.format == "book"
      book_path(media.id)
    elsif media.format == "album"
      album_path(media.id)
    else
      movie_path(media.id)
    end
  end

  def pick_edit_path(media)
    if media.format == "book"
      edit_book_path
    elsif media.format == "album"
      edit_album_path
    else
      edit_movie_path
    end
  end

  def pick_index_path(media)
    if media.format == "book"
      book_index_path
    elsif media.format == "album"
      album_index_path
    else
      movie_index_path
    end
  end

  def pick_new_path(media)
    if media.format == "book"
      new_book_path
    elsif media.format == "album"
      new_album_path
    else
      new_movie_path
    end
  end

  def creator(media)
    if media.format == "book"
      "Author"
    elsif media.format == "album"
      "Artist"
    else
      "Director"
    end 
  end

  def pick_format
    if request.path.include?("books")
      Medium.find_books
    elsif request.path.include?("movies")
      Medium.find_movies
    else
      Medium.find_albums
    end
  end
end





