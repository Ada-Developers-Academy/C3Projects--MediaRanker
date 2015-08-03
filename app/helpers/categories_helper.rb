module CategoriesHelper
  def display_name(category)
    category.full_name || category.name
  end

  def plural_display_name(category)
    display_name(category).pluralize
  end
end
