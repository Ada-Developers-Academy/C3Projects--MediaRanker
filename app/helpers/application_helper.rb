module ApplicationHelper
  def pick_upvote_path(controller, media)
    if controller == "movies"
      movie_upvote_path(media.id)
    elsif controller == "books"
      book_upvote_path(media.id)
    else
      album_upvote_path(media.id)
    end
    # return the right path
  end

  def pick_delete_path(media)
    path = media.class.to_s.downcase
    path += "_path"
    path
  end

  def pick_edit_path(controller, media)
    if controller == "movies"
      edit_movie_path(media.id)
    elsif controller == "books"
      edit_book_path(media.id)
    else
      edit_album_path(media.id)
    end 
  end

  def creator(media)
    if media.class == Movie
      :director
    elsif media.class == Book 
      :author
    else
      :artist
    end
  end

  def pick_index_path(media)
    path = media.class.to_s.downcase
    path += "s_path"
    path

  end

  def pick_new_path(media)
    path = "new_"
    path += media.first.class.to_s.downcase
    path += "_path"
  end
end





