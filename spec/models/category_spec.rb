require 'rails_helper'

RSpec.describe Category, type: :model do
  describe "model validations" do
    required_fields = [:name, :creator_noun, :created_verb]
    not_required_fields = [:full_name]
    unique_fields = [:name]

    required_fields.each do |field|
      it "requires a :#{ field }" do
        category = Category.new
        expect(category).to_not be_valid
        expect(category.errors.keys).to include(field)

        category = Category.new(field => "42")
        category.save
        expect(category.errors.keys).to_not include(field)
      end
    end

    not_required_fields.each do |field|
      it "does not require a :#{ field }" do
        category = Category.new(name: "Forty Eight Hours Of Sharks", creator_noun: "Adorable Fish", created_verb: "Eaten")
        expect(category).to be_valid
        expect(category.errors.keys).to_not include(field)

        category = Category.new(field => "42")
        category.save
        expect(category.errors.keys).to_not include(field)
      end
    end

    unique_fields.each do |field|
      it "does not allow duplicate values in :#{ field }" do
        cat1 = Category.create(name: "Game", full_name: "Board Game", creator_noun: "Creator", created_verb: "Crafted")
        cat2 = Category.create(name: "Game", full_name: "Video Game", creator_noun: "Developer", created_verb: "Developed")
        cat3 = Category.create(name: "Story", full_name: "Story Game", creator_noun: "Poet", created_verb: "Improvised")

        categories = Category.all

        expect(categories).to include(cat1)
        expect(categories).to include(cat3)
        expect(categories).not_to include(cat2)
      end
    end
  end

  describe "model relationships" do
    before :each do
      @cat1 = Category.create(name: "Game", full_name: "Board Game", creator_noun: "Creator", created_verb: "Crafted")
      @cat2 = Category.create(name: "Video", full_name: "Video Game", creator_noun: "Developer", created_verb: "Developed")
      @cat3 = Category.create(name: "Story", creator_noun: "Poet", created_verb: "Improvised")

      some_titles = ["Mr. Bojangles and the Minotaur", "Parry Hotter and the Wizard's Cap", "Dr. Legume", "Die Pflanze"]
      19.times do
        Medium.create(title: some_titles.sample, upvotes: 0, category_id: 1)
      end

      5.times do |count|
        Medium.create(title: some_titles.sample, upvotes: count, category_id: 2)
      end

      Medium.create(title: some_titles.sample, upvotes: 1, category_id: 1)
    end

    it "has zero to many media" do
      expect(@cat1.media.count).to eq(20)
      expect(@cat2.media.count).to eq(5)
      expect(@cat3.media.count).to eq(0)
    end

    it "has media only from its own category" do
      [@cat1, @cat2, @cat3].each do |cat|
        group = cat.media
        group_contains = group.map { |member| member.category.name }
        expect(group_contains.uniq.length).to be <= 1
      end
    end

    context "can access its media's :scopes, #methods, and :attributes" do
      it "can ask for :only_ten media" do
        [@cat1, @cat2, @cat3].each do |cat|
          expect(cat.media.only_ten.length).to be <= 10
        end
      end

      it "can ask for media :by_upvotes" do
        group1 = @cat1.media.by_upvotes
        group2 = @cat2.media.by_upvotes
        group2_start = group2.length - 1

        expect(group1.first.upvotes).to eq(1)

        5.times do |count|
          expect(group2[count].upvotes).to eq(group2_start - count)
        end
      end
    end
  end
end
