require 'rails_helper'

describe CategoriesHelper do
  before :each do
    @category1 = Category.create(name: "Game", full_name: "Board Game",
      creator_noun: "Creator", created_verb: "Crafted")
    @category2 = Category.create(name: "Video", full_name: "Video Game",
      creator_noun: "Developer", created_verb: "Developed")
    @category3 = Category.create(name: "Story", creator_noun: "Poet",
      created_verb: "Improvised")
  end

  it "has a #display_name that's its :full_name or :name" do
    expect(display_name(@category1)).to eq("Board Game")
    expect(display_name(@category2)).to eq("Video Game")
    expect(display_name(@category3)).to eq("Story")
  end

  it "has a #plural_display_name based on its display_name :name" do
    expect(plural_display_name(@category1)).to eq("Board Games")
    expect(plural_display_name(@category2)).to eq("Video Games")
    expect(plural_display_name(@category3)).to eq("Stories")
  end
end
