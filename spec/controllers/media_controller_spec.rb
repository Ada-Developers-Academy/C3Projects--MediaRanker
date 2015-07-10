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
  end
  #
  # describe "GET #root" do
  #   it "responds successfully with an HTTP 200 status code" do
  #     get :root
  #
  #     expect(response).to be_success
  #     expect(response).to have_http_status(200)
  #   end
  #
  #   it "renders the #root template" do
  #     get :root
  #
  #     expect(response).to render_template("root")
  #   end
  #
  #   context "loading the media" do
  #     it "loads the media into @media" do
  #       get :root
  #
  #       expect(assigns(:media).length).to be(5)
  #     end
  #
  #     it "sorts the media in ascending order by number of records (if some categories < 10)" do
  #       get :root
  #
  #       expect(assigns(:media)[0].length).to be(8)
  #       expect(assigns(:media)[1].length).to be(8)
  #       expect(assigns(:media)[2].length).to be(8)
  #       expect(assigns(:media)[3].length).to be(9)
  #       expect(assigns(:media)[4].length).to be(10)
  #     end
  #
  #     it "only loads categories in which media exists" do
  #       get :root
  #
  #       (assigns(:media)).each do |group|
  #         group.each do |member|
  #           expect(member.category_id).to_not be(6)
  #           expect(member.category.name).to_not eq("Game")
  #         end
  #       end
  #     end
  #
  #     it "only loads a maximum of 10 items from each category" do
  #       get :root
  #
  #       expect(Medium.where(category_id: 1).length).to eq(15)
  #       expect(assigns(:media)[4].length).to be(10)
  #     end
  #
  #     it "loads the items in descending order (by upvotes)" do
  #       get :root
  #
  #       expect(assigns(:media)[4].first.upvotes).to eq(14)
  #       expect(assigns(:media)[4].last.upvotes).to eq(5)
  #     end
  #   end
  # end
  #
  # describe "GET #index" do
  #   it "responds successfully with an HTTP 200 status code" do
  #     get :index, { category: @plural }
  #
  #     expect(response).to be_success
  #     expect(response).to have_http_status(200)
  #   end
  #
  #   it "renders the #index template" do
  #     get :index, { category: @plural }
  #
  #     expect(response).to render_template("index")
  #   end
  #
  #   context "loading the media" do
  #     it "loads all of the media into @media" do
  #       get :index, { category: @movies }
  #
  #       expect(assigns(:media).length).to eq(15)
  #     end
  #
  #     it "loads the items in descending order (by upvotes)" do
  #       get :index, { category: @movies }
  #
  #       expect(assigns(:media).first.upvotes).to eq(14)
  #       expect(assigns(:media).last.upvotes).to eq(0)
  #     end
  #
  #     it "only loads the items from the specified category" do
  #       get :index, { category: "movies" }
  #
  #       assigns(:media).each do |rec|
  #         expect(rec.category_id).to eq(1)
  #         expect(rec.category).to_not eq(2)
  #         expect(rec.category).to_not eq(3)
  #         expect(rec.category).to_not eq(6_140)
  #       end
  #     end
  #   end
  # end
  #
  # describe "GET #new" do
  #   it "responds successfully with an HTTP 200 status code" do
  #     get :new, { category: @plural }
  #
  #     expect(response).to be_success
  #     expect(response).to have_http_status(200)
  #   end
  #
  #   it "renders the #new template" do
  #     get :new, { category: @plural }
  #
  #     expect(response).to render_template("new")
  #   end
  # end
  #
  # describe "POST #create" do
  #   it "creates a new medium with valid parameters" do
  #     post :create, { category: "tvs", medium: { title: "Jarg Jeeooorrrrb" } }
  #
  #     expect(Medium.last.title).to eq("Jarg Jeeooorrrrb")
  #     expect(Medium.last.upvotes).to be(0)
  #   end
  #
  #   it "redirects to the new medium's #show page after creation" do
  #     post :create, { category: "tvs", medium: { title: "Jarg Jeeooorrrrb" } }
  #
  #     expect(response).to have_http_status(302)
  #     expect(response).to redirect_to(Medium.last.url)
  #   end
  #
  #   it "redirects to #new with invalid parameters" do
  #     post :create, { category: "tvs", medium: { description: "Jarg Jeeooorrrrb" } }
  #
  #     expect(response).to have_http_status(302)
  #     expect(Medium.last.title).to eq(@medium.title)
  #   end
  # end
  #
  # describe "GET #show" do
  #   it "responds successfully with an HTTP 200 status code" do
  #     get :show, { category: @medium.category.plural, id: @medium.id }
  #
  #     expect(response).to be_success
  #     expect(response).to have_http_status(200)
  #   end
  #
  #   it "renders the #show template" do
  #     get :show, { category: @medium.category.plural, id: @medium.id }
  #
  #     expect(response).to render_template("show")
  #   end
  # end
  #
  # describe "GET #edit" do
  #   it "responds successfully with an HTTP 200 status code" do
  #     get :edit, { category: @medium.category.plural, id: @medium.id }
  #
  #     expect(response).to be_success
  #     expect(response).to have_http_status(200)
  #   end
  #
  #   it "renders the #edit template" do
  #     get :edit, { category: @medium.category.plural, id: @medium.id }
  #
  #     expect(response).to render_template("edit")
  #   end
  # end

  describe "PATCH #update" do
    before :each do
      @new_title = "Treeface McPlantyPlant"
      @new_description = "Jarg Jeeooorrrrb"
    end

    # category = params[:category]

    # @category = Category.where(name: category.classify)[0]
    # @medium = params[:id] ? Medium.find(params[:id]) : Medium.new(category_id: @category.id)

    it "updates a medium" do
      patch :update, { category: @medium.category.plural, id: @medium.id, medium: { title: @new_title } }

      expect(@medium.title).to eq(@new_title)
      # expect(@medium.upvotes).to be(1)
    end

    it "redirects to a medium's show page after updating it" do
      patch :update, { category: @medium.category.plural, id: @medium.id, medium: { title: @medium.title, description: @new_description } }

      expect(@medium.description).to eq(@new_description)
      # expect(Medium.last.description).to eq(@medium.description)
      expect(response).to have_http_status(302)
      expect(response).to redirect_to(@medium.url)
    end

    it "redirects back to the edit page if invalid parameters" do
      patch :update, { category: @medium.category.plural, id: @medium.id, medium: { description: @new_description } }

      expect(@medium.description).to_not eq(@new_description)
      expect(response).to have_http_status(302)
      expect(response).to redirect_to("#{ @medium.url }/edit")
    end
  end

  describe "PATCH #upvote" do
    it "increases the upvotes of a given medium" do
      patch :upvote, { category: @medium.category.plural, id: @medium.id }

      expect(@medium.upvotes).to eq(1)
    end

    it "multiple transactions test" do
      patch :upvote, { category: @medium.category.plural, id: @medium.id }
      expect(@medium.upvotes).to eq(1)

      # patch :upvote, { category: @medium.category.plural, id: @medium.id }
      # expect(@medium.upvotes).to eq(2)
      #
      # patch :upvote, { category: @medium.category.plural, id: @medium.id }
      # expect(@medium.upvotes).to eq(3)
      #
      # patch :upvote, { category: @medium.category.plural, id: @medium.id }
      # expect(@medium.upvotes).to eq(4)
      #
      # patch :upvote, { category: @medium.category.plural, id: @medium.id }
      # expect(@medium.upvotes).to eq(5)
    end

    it "redirects to #show after incrementing the upvotes" do
      patch :upvote, { category: @medium.category.plural, id: @medium.id }

      expect(response).to have_http_status(302)
      expect(response).to redirect_to(@medium.url)
    end
  end

  # describe "DELETE #destroy" do
  #   before :each do
  #   end
  #
  #   it "creates a new medium with valid parameters" do
  #     post :create, { category: "tvs", medium: { title: "Jarg Jeeooorrrrb" } }
  #
  #     expect(Medium.last.title).to eq("Jarg Jeeooorrrrb")
  #     expect(Medium.last.upvotes).to be(0)
  #   end
  #
  #   it "redirects to #new with invalid parameters" do
  #     post :create, { category: "tvs", medium: { description: "Jarg Jeeooorrrrb" } }
  #
  #     expect(response).to have_http_status(302)
  #     expect(Medium.last.title).to eq(@medium.title)
  #   end
  # end
end
