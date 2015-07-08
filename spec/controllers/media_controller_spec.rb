require 'rails_helper'

RSpec.describe MediaController, type: :controller do
  before :each do
    Medium.create([{ category: "Movie", upvotes: 9, title: "The Ninth Element", creator: "Luc Besson" },
    { category: "Movie", upvotes: 9, title: "[Rec] day nine", creator: "Jaume Balagueró & Paco Plaza" },
    { category: "Movie", upvotes: 8, title: "8 Days Later", creator: "Danny Boyle" },
    { category: "Movie", upvotes: 12, title: "The Twelfth Element", creator: "Luc Besson" },
    { category: "Movie", upvotes: 24, title: "[Rec] 24hrs", creator: "Jaume Balagueró & Paco Plaza" },
    { category: "Movie", upvotes: 7, title: "28/4 Days Later", creator: "Danny Boyle" },
    { category: "Movie", upvotes: 70, title: "The 70th Element", creator: "Luc Besson" },
    { category: "Movie", upvotes: 6, title: "[Rec] 666", creator: "Jaume Balagueró & Paco Plaza" },
    { category: "Movie", upvotes: 5, title: "5 Days Later", creator: "Danny Boyle" },
    { category: "Movie", upvotes: 2, title: "The Fourth Element", creator: "Luc Besson" },
    { category: "Movie", upvotes: 4, title: "[Rec]2", creator: "Jaume Balagueró & Paco Plaza" },
    { category: "Movie", upvotes: 3, title: "28 Days Later", creator: "Danny Boyle" },
    { category: "Book", upvotes: 0, title: "The Color of Distance", creator: "Kim Stanley Robinson" },
    { category: "Book", upvotes: 0, title: "Red Mars", creator: "Kim Stanley Robinson" },
    { category: "Book", upvotes: 0, title: "The Lost World", creator: "Sir Arthur Conan Doyle" }])
    # { category: "Album", upvotes: 855, title: "Kompressor Does Not Dance", creator: "Kompressor" }
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

    context "loading the media" do
      it "loads the media into @categorized_records" do
        get :root

        expect(assigns(:categorized_records).length).to be(2)
      end

      it "only loads a maximum of 10 items from each category" do
        get :root

        expect(Medium.where(category: "Movie").length).to eq(12)
        expect(assigns(:categorized_records)[1].length).to be(10)
      end

      it "loads the items in descending order (by upvotes)" do
        get :root

        expect(assigns(:categorized_records)[1].first.title).to eq("The 70th Element")
        expect(assigns(:categorized_records)[1].last.title).to eq("[Rec]2")
      end
    end
  end

  describe "GET #index" do
    it "responds successfully with an HTTP 200 status code" do
      get :index, { category: "movies" }

      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "renders the index template" do
      get :index, { category: "movies" }

      expect(response).to render_template("index")
    end

    context "loading the media" do
      it "loads all of the media into @all_records" do
        get :index, { category: "movies" }

        expect(assigns(:all_records).length).to eq(12)
      end

      it "loads the items in descending order (by upvotes)" do
        get :index, { category: "movies" }

        expect(assigns(:all_records).first.title).to eq("The 70th Element")
        expect(assigns(:all_records).last.title).to eq("The Fourth Element")
      end

      it "only loads the items from the specified category" do
        get :index, { category: "movies" }

        assigns(:all_records).each do |rec|
          expect(rec.category).to eq("Movie")
          expect(rec.category).to_not eq("Book")
          expect(rec.category).to_not eq("Album")
          expect(rec.category).to_not eq("Potato")
        end
      end
    end
  end

  describe "GET #new" do
    it "responds successfully with an HTTP 200 status code" do
      get :new, { category: "movies" }

      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "renders the new template" do
      get :new, { category: "movies" }

      expect(response).to render_template("new")
    end
  end
#
#   describe "POST #create" do
#   end
#
  # describe "GET #show" do
  #   it "responds successfully with an HTTP 200 status code" do
  #     get :show
  #
  #     expect(response).to be_success
  #     expect(response).to have_http_status(200)
  #   end
#
#     it "renders the show template" do
#       get :show
#
#       expect(response).to render_template("show")
#     end
#
#     # it "loads the" do
#     # end
#   end
#
#   describe "GET #edit" do
#     it "responds successfully with an HTTP 200 status code" do
#       get :edit
#
#       expect(response).to be_success
#       expect(response).to have_http_status(200)
#     end
#
#     it "renders the edit template" do
#       get :edit
#
#       expect(response).to render_template("root")
#     end
#   end
#
#   describe "PATCH #update" do
#   end
#
#   describe "PATCH #upvote" do
#   end
#
#   describe "DELETE #destroy" do
#   end
end
