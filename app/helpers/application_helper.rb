module ApplicationHelper
  def pick_upvote_path(controller, media)
    if controller = "movies"
      movie_upvote_path(media.id)
    elsif controller = "books"
      book_upvote_path(media.id)
    end
    # return the right path
  end
end
