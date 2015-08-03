module MediaHelper
  def created_by(medium) # eg, Created by Quentin Tarantino
    unless (medium.creator.nil? || medium.creator.empty?)
      return "#{ medium.category.created_verb } by #{ medium.creator }"
    end
  end

  def creator_phrase(medium) # eg, Quentin Tarantino's Inglorious Basterds
    return medium.creator ? "#{ medium.creator }'s #{ medium.title }" : "#{ medium.title }"
  end
end
