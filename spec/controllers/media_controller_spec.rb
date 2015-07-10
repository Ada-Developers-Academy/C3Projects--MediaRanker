require 'rails_helper'

RSpec.describe MediaController, type: :controller do
  before :each do
    some_titles = ["The Ninth Element", "[Rec] 666", "8 Days Later", "5 Days Later",
      "The 70th Element", "The Found World", "The Fourth Element", "[Rec] 24hrs",
      "Let The Wrong One In", "Let The Right One Out", "Kompressor Does Not Pants"]

    some_categories = ["Wood", "Egg", "Potato", "Seed", "Movie", "Table", "Planty McPlant"]

    some_categories.each_with_index do |cat|
      Category.create({name: cat, creator_noun: "noun", created_verb: "verb"})
    end

    30.times do
      Medium.create({category_id: 1, upvotes: 0, title: some_titles.sample})
    end

    @media1 = Category.find(1).media.first

    20.times do
      Medium.create({category_id: 2, upvotes: 0, title: some_titles.sample})
    end

    @media2 = Category.find(2).media.first

    @medium = Medium.create({category_id: 4, upvotes: 0, title: some_titles.sample})

    @media3 = Category.find(4).media.first

    @meda = [@media1, @media2, @media3].sample
  end

  describe "GET #root" do
    it "responds successfully with an HTTP 200 status code" do
      get :root

      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "renders the root template" do
      get :root

      expect(response).to render_template("root")
    end

    # context "loading the media" do
    #   it "loads the media into @categorized_records" do
    #     get :root
    #
    #     expect(assigns(:categorized_records).length).to be(2)
    #   end
    #
    #   it "only loads a maximum of 10 items from each category" do
    #     get :root
    #
    #     expect(Medium.where( category_id: 1).length).to eq(12)
    #     expect(assigns(:categorized_records)[1].length).to be(10)
    #   end
    #
    #   it "loads the items in descending order (by upvotes)" do
    #     get :root
    #
    #     expect(assigns(:categorized_records)[1].first.title).to eq("The 70th Element")
    #     expect(assigns(:categorized_records)[1].last.title).to eq("[Rec]2")
    #   end
    # end
  end

  describe "GET #index" do
    it "responds successfully with an HTTP 200 status code" do
      get :index, category: "seeds"

      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "renders the index template" do
      get index_path(@medium.category.plural)

      expect(response).to render_template("index")
    end
#
#     # context "loading the media" do
#     #   it "loads all of the media into @all_records" do
#     #     get :index, { category: "woods" }
#     #
#     #     expect(assigns(:all_records).length).to eq(12)
#     #   end
#     #
#     #   it "loads the items in descending order (by upvotes)" do
#     #     get :index, { category: "woods" }
#     #
#     #     expect(assigns(:all_records).first.title).to eq("The 70th Element")
#     #     expect(assigns(:all_records).last.title).to eq("The Fourth Element")
#     #   end
#     #
#     #   it "only loads the items from the specified category" do
#     #     get :index, { category: "woods" }
#     #
#     #     assigns(:all_records).each do |rec|
#     #       expect(rec.category).to eq("Movie")
#     #       expect(rec.category).to_not eq("Book")
#     #       expect(rec.category).to_not eq("Album")
#     #       expect(rec.category).to_not eq("Potato")
#     #     end
#     #   end
#     # end
  end
#
#   describe "GET #new" do
#     it "responds successfully with an HTTP 200 status code" do
#       get :new, category: "woods"
#
#       expect(response).to be_success
#       expect(response).to have_http_status(200)
#     end
#
#     it "renders the new template" do
#       get :new, { category: "woods" }
#
#       expect(response).to render_template("new")
#     end
#   end
# #
# #   describe "POST #create" do
# #   end
# #
#   describe "GET #show" do
#     it "responds successfully with an HTTP 200 status code" do
#       get :show, { category: "woods" }
#
#       expect(response).to be_success
#       expect(response).to have_http_status(200)
#     end
#
#     it "renders the show template" do
#       get :show, { category: "woods" }
#
#       expect(response).to render_template("show")
#     end
# #
# #     # it "loads the" do
# #     # end
#   end
#
#   describe "GET #edit" do
#     it "responds successfully with an HTTP 200 status code" do
#       get :edit, { category: "woods" }
#
#       expect(response).to be_success
#       expect(response).to have_http_status(200)
#     end
#
#     it "renders the edit template" do
#       get :edit, { category: "woods" }
#
#       expect(response).to render_template("root")
#     end
#   end
# #
# #   describe "PATCH #update" do
# #   end
# #
# #   describe "PATCH #upvote" do
# #   end
# #
# #   describe "DELETE #destroy" do
# #   end
end
