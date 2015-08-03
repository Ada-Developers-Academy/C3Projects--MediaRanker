module ApplicationHelper
  def link_to_all_media
    link_to "View All Media", root_path, class: "btn btn-default", role: "button"
  end
end
