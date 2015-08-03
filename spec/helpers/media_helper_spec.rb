require 'rails_helper'

describe MediaHelper do
  before :each do
    category1 = Category.create(name: "Potato", full_name: "Mr. Potato Head",
      creator_noun: "PotatoFace", created_verb: "Grown")
    @medium1 = Medium.create(title: "Forty Eight Hours Of Sharks",
      creator: "Spud McNightshade", upvotes: 0, category_id: category1.id)

    category2 = Category.create(name: "Egg", full_name: "Egghead",
      creator_noun: "Chicken", created_verb: "Laid")
    @medium2 = Medium.create(title: "Forty Eight Hours Of Sharks",
      creator: "Die Pflanze", upvotes: 0, category_id: category2.id)

    category3 = Category.create(name: "Seed", creator_noun: "Plant", created_verb: "Planted")
    @medium3 = Medium.create(title: "Forty Eight Hours Of Sharks", upvotes: 0,
      category_id: category3.id)
  end

  it "has a #created_by statement that's based on its :creator and category" do
    expect(created_by(@medium1)).to eq("Grown by Spud McNightshade")
    expect(created_by(@medium2)).to eq("Laid by Die Pflanze")
    expect(created_by(@medium3)).to eq(nil)
  end

  it "has a #creator_phrase that's based on its :creator and category" do
    expect(creator_phrase(@medium1)).to eq("Spud McNightshade's Forty Eight Hours Of Sharks")
    expect(creator_phrase(@medium2)).to eq("Die Pflanze's Forty Eight Hours Of Sharks")
    expect(creator_phrase(@medium3)).to eq("Forty Eight Hours Of Sharks")
  end
end
