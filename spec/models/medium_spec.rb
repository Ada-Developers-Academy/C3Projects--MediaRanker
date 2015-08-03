require 'rails_helper'

RSpec.describe Medium, type: :model do
  before :each do
    Category.create(
      name: "Potato", full_name: "Mr. Potato Head", creator_noun: "Nightshade Variety", created_verb: "Grown"
    )
    @medium = Medium.create(
      title: "Forty Eight Hours Of Sharks", creator: "Spud McNightshade", upvotes: 2, category_id: 1
    )
  end

  describe "model validations" do
    required_fields = [:title, :upvotes, :category_id]
    not_required_fields = [:creator, :description]
    integer_fields = [:upvotes, :category_id]

    valid_integers = [ "1", 1, 92_300_462, "4000" ]
    invalid_integers = [
      "sharkface", 3.141, [2086], { upvotes: 2086 }, "2086 C.E.", -821, -1,
      "1.0.23", "127.0.0.1", [], {}, "", Medium.new, nil, Time.now,
      Date.parse("2006 June 7th", { category_id: 2086 })
    ]

    required_fields.each do |field|
      it "requires a :#{ field }" do
        medium = Medium.new
        expect(medium).to_not be_valid
        expect(medium.errors.keys).to include(field)

        medium = Medium.new(field => "42")
        medium.save
        expect(medium.errors.keys).to_not include(field)
      end

      if integer_fields.include? field
        it "requires an integer value to be valid" do
          invalid_integers.each do |not_int|
            # it "doesn't validate #{ not_int.inspect } for :#{ field }" do
              medium = Medium.new(field => not_int)
              medium.save
              expect(medium.errors.keys).to include(field)
            # end
          end

          valid_integers.each do |int|
            # it "does validate #{ int.inspect } for :#{ field }" do
              medium = Medium.new(field => int)
              medium.save
              expect(medium.errors.keys).to_not include(field)
            # end
          end
        end
      end
    end

    not_required_fields.each do |field|
      it "does not require a :#{ field }" do
        medium = Medium.new(title: "Forty Eight Hours Of Sharks", upvotes: 0, category_id: 1)
        expect(medium).to be_valid
        expect(medium.errors.keys).to_not include(field)

        medium = Medium.new(field => "42")
        medium.save
        expect(medium.errors.keys).to_not include(field)
      end

      if integer_fields.include? field
        it "requires an integer value to be valid" do
          invalid_integers.each do |not_int|
            medium = Medium.new(field => not_int)
            medium.save
            expect(medium.errors.keys).to include(field)
          end

          valid_integers.each do |int|
            medium = Medium.new(field => int)
            medium.save
            expect(medium.errors.keys).to_not include(field)
          end
        end
      end
    end
  end

  describe "model relationships" do
    it "belongs to a category" do
      expect(@medium.category.class).to be(Category)
    end

    it "can access its category's :attributes" do
      expect(@medium.category.full_name).to eq("Mr. Potato Head")
      expect(@medium.category.creator_noun).to eq("Nightshade Variety")
      expect(@medium.category.created_verb).to eq("Grown")
    end

    it "can access its category's #methods" do
      expect(@medium.category.plural).to eq("potatos")
      expect(@medium.category.display_name).to eq("Mr. Potato Head")
    end
  end

  describe "medium instance methods" do
    before :each do
      # Category.create(name: "Potato", full_name: "Mr. Potato Head", creator_noun: "Spud McNightshade", created_verb: "Grown")
      # @medium = Medium.create(title: "Forty Eight Hours Of Sharks", upvotes: 0, category_id: 1)
      Category.create(name: "Egg", full_name: "Egghead", creator_noun: "Chicken", created_verb: "Laid")
      Category.create(name: "Seed", creator_noun: "Plant", created_verb: "Planted")
      @medium2 = Medium.create(title: "Forty Eight Hours Of Sharks", creator: "Die Pflanze", upvotes: 0, category_id: 3)
      @medium3 = Medium.create(title: "Forty Eight Hours Of Sharks", upvotes: 0, category_id: 2)
    end

    it "has a #url that consists of its category :name & :id number" do
      expect(@medium.url).to eq("/potatos/#{ @medium.id }")
      expect(@medium2.url).to eq("/seeds/#{ @medium2.id }")
      expect(@medium3.url).to eq("/eggs/#{ @medium3.id }")
    end

    it "has a #url_base that consists of just the category name" do
      expect(@medium.url_base).to eq("/potatos")
      expect(@medium2.url_base).to eq("/seeds")
      expect(@medium3.url_base).to eq("/eggs")
    end

    it "has a #created_by statement that's based on its :creator and category" do
      expect(@medium.created_by).to eq("Grown by Spud McNightshade")
      expect(@medium2.created_by).to eq("Planted by Die Pflanze")
      expect(@medium3.created_by).to eq(nil)
    end

    it "has a #creator_phrase that's based on its :creator and category" do
      expect(@medium.creator_phrase).to eq("Spud McNightshade's Forty Eight Hours Of Sharks")
      expect(@medium2.creator_phrase).to eq("Die Pflanze's Forty Eight Hours Of Sharks")
      expect(@medium3.creator_phrase).to eq("Forty Eight Hours Of Sharks")
    end
  end

  describe "scopes" do
    before :each do
      Category.create(name: "Egg", full_name: "Egghead", creator_noun: "Chicken", created_verb: "Laid")
      Category.create(name: "Seed", creator_noun: "Plant", created_verb: "Planted")

      @original_first = @medium

      medium2 = Medium.create({
        category_id: 1, upvotes: 9, title: "The Ninth Element", creator: "Luc Besson"
      })
      medium3 = Medium.create({
        category_id: 1, upvotes: 9, title: "[Rec] day nine", creator: "Jaume Balagueró & Paco Plaza"
      })
      medium4 = Medium.create({
        category_id: 1, upvotes: 8, title: "8 Days Later", creator: "Danny Boyle"
      })
      medium5 = Medium.create({
        category_id: 1, upvotes: 24, title: "[Rec] 24hrs", creator: "Jaume Balagueró & Paco Plaza"
      })
      @upvotes_tenth = Medium.create({
        category_id: 1, upvotes: 7, title: "28/4 Days Later", creator: "Danny Boyle"
      })
      medium7 = Medium.create({
        category_id: 1, upvotes: 6, title: "[Rec] 666", creator: "Jaume Balagueró & Paco Plaza"
      })
      @worst_upvotes = Medium.create({
        category_id: 1, upvotes: 1, title: "The Fourth Element", creator: "Luc Besson"
      })
      medium9 = Medium.create({
        category_id: 1, upvotes: 5, title: "5 Days Later", creator: "Danny Boyle"
      })
      @original_tenth = Medium.create({
        category_id: 1, upvotes: 3, title: "28 Days Later", creator: "Danny Boyle"
      })
      medium11 = Medium.create({
        category_id: 2, upvotes: 38, title: "Red Mars", creator: "Kim Stanley Robinson"
      })
      medium12 = Medium.create({
        category_id: 1, upvotes: 12, title: "The Twelfth Element", creator: "Luc Besson"
      })
      @best_upvotes = Medium.create({
        category_id: 2, upvotes: 855, title: "The Color of Distance", creator: "Kim Stanley Robinson"
      })
      medium13 = Medium.create({
        category_id: 2, upvotes: 12, title: "The Lost World", creator: "Sir Arthur Conan Doyle"
      })
      @original_last = Medium.create({
        category_id: 2, upvotes: 854, title: "Kompressor Does Not Dance", creator: "Kompressor"
      })
    end

    it "can be limited to ten results in scope :only_ten" do
      first_test = Medium.only_ten
      second_test = Medium.by_upvotes.only_ten

      expect(first_test.length).to be(10)
      expect(second_test.length).to be(10)
      expect(first_test.last).to eq(@original_tenth)
      expect(second_test.last).to eq(@upvotes_tenth)

      5.times do
        Medium.create({ category_id: 1, upvotes: 0, title: "Mr. Potato Face" })
      end

      expect(Medium.only_ten.length).to be(10)

      20.times do
        Medium.create({ category_id: 1, upvotes: 0, title: "Mr. Potato Face" })
      end

      expect(Medium.only_ten.length).to be(10)
    end

    it "can be sorted by :upvotes in scope :by_upvotes" do
      expect(Medium.first).to eq(@original_first)
      expect(Medium.by_upvotes.first).to eq(@best_upvotes)

      expect(Medium.last).to eq(@original_last)
      expect(Medium.by_upvotes.last).to eq(@worst_upvotes)
    end
  end

  describe "class method #categorization" do
    before :each do
      Category.create(name: "Egg", full_name: "Egghead", creator_noun: "Chicken", created_verb: "Laid")
      Category.create(name: "Seed", creator_noun: "Plant", created_verb: "Planted")

      @original_first = @medium

      medium2 = Medium.create({
        category_id: 1, upvotes: 9, title: "The Ninth Element", creator: "Luc Besson"
      })
      medium3 = Medium.create({
        category_id: 1, upvotes: 9, title: "[Rec] day nine", creator: "Jaume Balagueró & Paco Plaza"
      })
      medium4 = Medium.create({
        category_id: 1, upvotes: 8, title: "8 Days Later", creator: "Danny Boyle"
      })
      medium5 = Medium.create({
        category_id: 1, upvotes: 24, title: "[Rec] 24hrs", creator: "Jaume Balagueró & Paco Plaza"
      })
      @upvotes_tenth = Medium.create({
        category_id: 1, upvotes: 7, title: "28/4 Days Later", creator: "Danny Boyle"
      })
      medium7 = Medium.create({
        category_id: 1, upvotes: 6, title: "[Rec] 666", creator: "Jaume Balagueró & Paco Plaza"
      })
      @worst_upvotes = Medium.create({
        category_id: 1, upvotes: 1, title: "The Fourth Element", creator: "Luc Besson"
      })
      medium9 = Medium.create({
        category_id: 1, upvotes: 5, title: "5 Days Later", creator: "Danny Boyle"
      })
      @original_tenth = Medium.create({
        category_id: 1, upvotes: 3, title: "28 Days Later", creator: "Danny Boyle"
      })
      medium11 = Medium.create({
        category_id: 2, upvotes: 38, title: "Red Mars", creator: "Kim Stanley Robinson"
      })
      medium12 = Medium.create({
        category_id: 1, upvotes: 12, title: "The Twelfth Element", creator: "Luc Besson"
      })
      @best_upvotes = Medium.create({
        category_id: 2, upvotes: 855, title: "The Color of Distance", creator: "Kim Stanley Robinson"
      })
      medium13 = Medium.create({
        category_id: 2, upvotes: 12, title: "The Lost World", creator: "Sir Arthur Conan Doyle"
      })
      @original_last = Medium.create({
        category_id: 2, upvotes: 854, title: "Kompressor Does Not Dance", creator: "Kompressor"
      })

      @media = Medium.categorize
    end

    it "returns an array of categorized media" do
      @media.each do |group|
        group_contains = group.map { |member| member.category.name }
        expect(group_contains.uniq.length).to be(1)
      end
    end

    it "sorts the array by number of media in each category" do
      previous_group_size = 0

      @media.each do |group|
        current_group_size = group.length
        expect(current_group_size).to be >= previous_group_size
        previous_group_size = current_group_size
      end
    end

    it "does not include categories for which there are no media" do
      categories = Category.all.map { |cat| cat.name }
      expect(categories.length).to eq(3)

      media_contains = @media.map do |group|
        group_contains = group.map { |member| member.category.name }
        expect(group_contains.uniq.length).to be(1)
        group[0]
      end

      expect(media_contains.length).to eq(2)
      expect(media_contains).to_not include("Seed")
    end

    it "pulls only ten records from each category" do
      5.times do
         Medium.create({ category_id: 1, upvotes: 0, title: "The Color of Distance" })
      end
    end
  end
end
