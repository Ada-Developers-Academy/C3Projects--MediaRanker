require 'rails_helper'

describe ApplicationHelper do
  it "#plural pluralizes a category's name" do
    category1 = Category.create(name: "Game", full_name: "Board Game",
      creator_noun: "Creator", created_verb: "Crafted")
    category2 = Category.create(name: "Video", full_name: "Video Game",
      creator_noun: "Developer", created_verb: "Developed")
    category3 = Category.create(name: "Story", creator_noun: "Poet", created_verb: "Improvised")

    expect(plural(category1)).to eq("games")
    expect(plural(category2)).to eq("videos")
    expect(plural(category3)).to eq("stories")
  end

  context "custom URL helpers" do
    let(:category) { Category.create(name: "Video", full_name: "Video Game",
      creator_noun: "Developer", created_verb: "Developed") }
    let (:medium) { Medium.create(title: "Forty Eight Hours Of Sharks",
      creator: "Spud McNightshade", upvotes: 2, category_id: category.id) }

    it "#category_path" do
      expect(category_path(category)).to eq("/videos")
    end

    it "#medium_path outputs" do
      expect(medium_path(medium)).to eq("/videos/1")
    end

    it "#new_medium_path" do
      expect(new_medium_path(medium)).to eq("/videos/new")
    end

    it "#edit_medium_path" do
      expect(edit_medium_path(medium)).to eq("/videos/1/edit")
    end

    it "#upvote_medium_path" do
      expect(upvote_medium_path(medium)).to eq("/videos/1/upvote")
    end
  end
end
