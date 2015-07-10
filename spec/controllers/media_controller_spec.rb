require 'rails_helper'

RSpec.describe MediaController, type: :controller do
  before :each do
    some_titles = ["The Ninth Element", "[Rec] 666", "8 Days Later", "5 Days Later",
      "The 70th Element", "The Found World", "The Fourth Element", "[Rec] 24hrs",
      "Let The Wrong One In", "Let The Right One Out", "Kompressor Does Not Pants"]

    some_categories = ["Movie", "Album", "Book", "Webcomic", "Tv"]

    some_categories.each_with_index do |cat|
      Category.create({name: cat, creator_noun: "noun", created_verb: "verb"})
    end

    30.times do
      Medium.create({category_id: [1, 2, 3, 4, 5].sample, upvotes: 0, title: some_titles.sample})
    end

    @medium = Medium.create({category_id: 4, upvotes: 0, title: some_titles.sample})
    @media = Medium.categorize
  end

  describe "GET #index" do
    it "get :index, category: 'webcomics'" do
      @category = Category.where(name: "Webcomic")[0]

      get :index, category: "webcomics"

      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "get :index, keys: { category: 'webcomics' }" do
      @category = Category.where(name: "Webcomic")[0]

      # get index_path(@medium.category.plural)
      get :index, keys: { category: "webcomics" }

      expect(response).to render_template("index")
    end
  end
end
