require 'rails_helper'

RSpec.describe VideoGame, type: :model do
  it "orders by ranking descending" do
    street_fighter = VideoGame.create!(title: "Street Fighter", stars: 12)
    smash_bros = VideoGame.create!(title: "Super Mario Smash Brothers", stars: 24)

    expect(VideoGame.ordered_by_stars).to eq([smash_bros, street_fighter])
  end
end
