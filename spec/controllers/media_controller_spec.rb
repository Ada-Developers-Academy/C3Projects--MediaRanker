require 'rails_helper'

RSpec.describe MediaController, type: :controller do
  before :each do
    some_titles = ["The Ninth Element", "[Rec] 666", "8 Days Later", "5 Days Later",
      "The 70th Element", "The Found World", "The Fourth Element", "[Rec] 24hrs",
      "Let The Wrong One In", "Let The Right One Out", "Kompressor Does Not Pants"]

    some_categories = ["Movie", "Album", "Book", "Webcomic", "Tv", "Game"]

    some_categories.each_with_index do |cat|
      Category.create({name: cat, creator_noun: "noun", created_verb: "verb"})
    end

    [2,3,4,5].each do |num|
      8.times do
        Medium.create({category_id: num, upvotes: 0, title: some_titles.sample})
      end
    end

    @category = Category.where(name: some_categories.sample)[0]
    @plural = @category.plural
    @media = Medium.categorize

    # these are for testing some specifics:
    15.times do |count|
      Medium.create({category_id: 1, upvotes: count, title: some_titles.sample})
    end

    @movie = "Movie"
    @movies = "movies"

    @medium = Medium.create({category_id: 4, upvotes: 0, title: some_titles.sample}) # id 46
    @medium_category = "webcomics"
  end

  describe "GET #root" do
     it "responds successfully with an HTTP 200 status code" do
       get :root

       expect(response).to be_success
       expect(response).to have_http_status(200)
     end

     it "renders the #root template" do
       get :root

       expect(response).to render_template("root")
     end

     context "loading the media" do
       it "loads the media into @media" do
         get :root

         expect(assigns(:media).length).to be(5)
       end

       it "only loads a maximum of 10 items from each category" do
         get :root

         expect(Medium.where(category_id: 1).length).to eq(15)
         expect(assigns(:media)[4].length).to be(10)
       end

       it "loads the items in descending order (by upvotes)" do
         get :root

         expect(assigns(:media)[4].first.upvotes).to eq(14)
         expect(assigns(:media)[4].last.upvotes).to eq(5)
       end
     end
   end

   describe "GET #index" do
     it "responds successfully with an HTTP 200 status code" do
       get :index, { category: @plural }

       expect(response).to be_success
       expect(response).to have_http_status(200)
     end

     it "renders the #index template" do
       get :index, { category: @plural }

       expect(response).to render_template("index")
     end

     context "loading the media" do
       it "loads all of the media into @media" do
         get :index, { category: @movies }

         expect(assigns(:media).length).to eq(15)
       end

       it "loads the items in descending order (by upvotes)" do
         get :index, { category: @movies }

         expect(assigns(:media).first.upvotes).to eq(14)
         expect(assigns(:media).last.upvotes).to eq(0)
       end

       it "only loads the items from the specified category" do
         get :index, { category: "movies" }

         assigns(:media).each do |rec|
           expect(rec.category_id).to eq(1)
           expect(rec.category).to_not eq(2)
           expect(rec.category).to_not eq(3)
           expect(rec.category).to_not eq(6_140)
         end
       end
     end
   end

   describe "GET #new" do
     it "responds successfully with an HTTP 200 status code" do
       get :new, { category: @plural }

       expect(response).to be_success
       expect(response).to have_http_status(200)
     end

     it "renders the #new template" do
       get :new, { category: @plural }

       expect(response).to render_template("new")
     end
   end
 #
 #   describe "POST #create" do
 #   end
 #
   describe "GET #show" do
     it "responds successfully with an HTTP 200 status code" do
       get :show, { category: @medium_category, id: @medium.id }

       expect(response).to be_success
       expect(response).to have_http_status(200)
     end

     it "renders the #show template" do
       get :show, { category: @medium_category, id: @medium.id }

       expect(response).to render_template("show")
     end
 #
 #     # it "loads the" do
 #     # end
   end
 #
   describe "GET #edit" do
     it "responds successfully with an HTTP 200 status code" do
       get :edit, { category: @medium_category, id: @medium.id }

       expect(response).to be_success
       expect(response).to have_http_status(200)
     end

     it "renders the #edit template" do
       get :edit, { category: @medium_category, id: @medium.id }

       expect(response).to render_template("edit")
     end
   end
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
