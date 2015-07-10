module ApplicationHelper

  #decides on a path for upvote action
  def pick_upvote_path(media)
    if media.format == "book"
      book_upvote_path(media.id)
    elsif media.format == "album"
      album_upvote_path(media.id)
    else
      movie_upvote_path(media.id)
    end
  end

  #decides on a path for show, update, and destroy action
  def pick_path(media)
    if media.format == "book"
      book_path(media.id)
    elsif media.format == "album"
      album_path(media.id)
    else
      movie_path(media.id)
    end
  end

  #decides on a path for the edit action
  def pick_edit_path(media)
    if media.format == "book"
      edit_book_path
    elsif media.format == "album"
      edit_album_path
    else
      edit_movie_path
    end
  end

  #decides on a path for the index action
  def pick_index_path(media)
    if media.format == "book"
      book_index_path
    elsif media.format == "album"
      album_index_path
    else
      movie_index_path
    end
  end

  #decides on a path for the new action
  def pick_new_path(media)
    if media.format == "book"
      new_book_path
    elsif media.format == "album"
      new_album_path
    else
      new_movie_path
    end
  end

  #choses a creator name for each media in the form
  def creator
    if request.path.include?("books")
      "Author"
    elsif request.path.include?("movies")
      "Director"
    else
      "Artist"
    end
  end

  #choses a format for the format column in the table when creating a media. 
  def pick_format
    if request.path.include?("books")
      "book"
    elsif request.path.include?("movies")
      "movie"
    elsif request.path.include?("albums")
      "album"
    end
  end

  #choses a submit name for the form.
  def submit_type(method)
    if method == :patch
      "Update"
    elsif method == :post
      "Create"
    end
  end
end





