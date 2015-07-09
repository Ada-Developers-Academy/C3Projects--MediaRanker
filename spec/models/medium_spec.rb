require 'rails_helper'

RSpec.describe Medium, type: :model do
  describe "model validations" do
    before :each do
      Category.create(
        name: "Potato",
        full_name: "Mr. Potato Head",
        creator_noun: "Spud McNightshade",
        created_verb: "Grown"
      )
    end

    required_fields = [:title, :upvotes, :category_id]
    not_required_fields = [:creator, :description]
    integer_fields = [:upvotes, :category_id]

    valid_integers = [ "1", 1, 92_300_462, "4000" ]
    invalid_integers = [
      "sharkface", 3.141, [2086], { year: 2086 }, "2086 C.E.", -821, -1,
      "1.0.23", "127.0.0.1", [], {}, "", Medium.new, nil, Time.now,
      Date.parse("2006 June 7th")
    ]

    required_fields.each do |field|
      it "requires a #{ field }" do
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
            # it "doesn't validate #{ not_int.inspect } for #{ field }" do
              medium = Medium.new(field => not_int)
              medium.save
              expect(medium.errors.keys).to include(field)
            # end
          end

          valid_integers.each do |int|
            # it "does validate #{ int.inspect } for #{ field }" do
              medium = Medium.new(field => int)
              medium.save
              expect(medium.errors.keys).to_not include(field)
            # end
          end
        end
      end
    end

    not_required_fields.each do |field|
      it "does not require a #{ field }" do
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
    it "belongs to category" do
    end
  end
  #
  # describe "relationship interactions" do
  #   before :each do
  #     Medium.create([{ category: "Movie", upvotes: 9, title: "The Ninth Element", creator: "Luc Besson" },
  #     { category: "Movie", upvotes: 9, title: "[Rec] day nine", creator: "Jaume Balagueró & Paco Plaza" },
  #     { category: "Movie", upvotes: 8, title: "8 Days Later", creator: "Danny Boyle" },
  #     { category: "Movie", upvotes: 12, title: "The Twelfth Element", creator: "Luc Besson" },
  #     { category: "Movie", upvotes: 24, title: "[Rec] 24hrs", creator: "Jaume Balagueró & Paco Plaza" },
  #     { category: "Movie", upvotes: 7, title: "28/4 Days Later", creator: "Danny Boyle" },
  #     { category: "Movie", upvotes: 70, title: "The 70th Element", creator: "Luc Besson" },
  #     { category: "Movie", upvotes: 6, title: "[Rec] 666", creator: "Jaume Balagueró & Paco Plaza" },
  #     { category: "Movie", upvotes: 5, title: "5 Days Later", creator: "Danny Boyle" },
  #     { category: "Movie", upvotes: 2, title: "The Fourth Element", creator: "Luc Besson" },
  #     { category: "Movie", upvotes: 4, title: "[Rec]2", creator: "Jaume Balagueró & Paco Plaza" },
  #     { category: "Movie", upvotes: 3, title: "28 Days Later", creator: "Danny Boyle" },
  #     { category: "Book", upvotes: 0, title: "The Color of Distance", creator: "Kim Stanley Robinson" },
  #     { category: "Book", upvotes: 0, title: "Red Mars", creator: "Kim Stanley Robinson" },
  #     { category: "Book", upvotes: 0, title: "The Lost World", creator: "Sir Arthur Conan Doyle" }])
  #     # { category: "Album", upvotes: 855, title: "Kompressor Does Not Dance", creator: "Kompressor" }
  #   end
  # end
end
