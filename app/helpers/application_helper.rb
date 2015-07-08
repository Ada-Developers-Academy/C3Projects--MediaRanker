module ApplicationHelper
  def pick_upvote_path(media)
    path = "#{media.format}_upvote_path"
  end

  def pick_delete_path(media)
    path = media.format
    path += "_path(#{media.id})"
    path
  end

  def pick_edit_path(media)
    path = "edit_#{media.format}_path(#{media.id})"
    path 
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
    path = "#{media.format}_index_path"
    path

  end

  def pick_new_path(media)
    path = "new_"
    path += media.first.class.to_s.downcase
    path += "_path"
  end
end





