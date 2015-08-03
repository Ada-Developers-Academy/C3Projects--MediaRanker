module ApplicationHelper
  # custom URL helpers

  def plural(category)
    category.name.downcase.pluralize
  end

  def category_path(category)
    "/#{ plural(category) }"
  end

  def new_medium_path(medium)
    category_path(medium.category) + "/new"
  end

  def medium_path(medium)
    category_path(medium.category) + "/#{ medium.id }"
  end

  def edit_medium_path(medium)
    medium_path(medium) + "/edit"
  end

  def upvote_medium_path(medium)
    medium_path(medium) + "/upvote"
  end
end
