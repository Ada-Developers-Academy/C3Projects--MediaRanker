require 'rails_helper'

RSpec.describe MediaController, type: :controller do
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
    #
    # it "loads all of the media into @categorized_records" do
    #   # post1, post2 = Post.create!, Post.create!
    #   #
    #   # get :root
    #   #
    #   # expect(assigns(:posts)).to match_array([post1, post2])
    # end
    #
    # it "only loads a maximum of 10 items from each category" do
    # end
    #
    # it "loads the items in descending order (by upvotes)" do
    # end
  end

  describe "GET #index" do
    it "responds successfully with an HTTP 200 status code" do
      get :index

      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "renders the index template" do
      get :index

      expect(response).to render_template("index")
    end

    #
    # it "loads all of the media into @all_records" do
    # end
    #
    # it "loads ALL of the media from its specified category" do
    # end
    #
    # it "loads the items in descending order (by upvotes)" do
    # end
    #
    # it "only loads the items from the specified category" do
    # end
  end

  describe "GET #new" do
    it "responds successfully with an HTTP 200 status code" do
      get :new

      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "renders the new template" do
      get :new

      expect(response).to render_template("new")
    end
  end

  describe "POST #create" do
  end

  describe "GET #show" do
    it "responds successfully with an HTTP 200 status code" do
      get :show

      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "renders the show template" do
      get :show

      expect(response).to render_template("show")
    end

    # it "loads the" do
    # end
  end

  describe "GET #edit" do
    it "responds successfully with an HTTP 200 status code" do
      get :edit

      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "renders the edit template" do
      get :edit

      expect(response).to render_template("root")
    end
  end

  describe "PATCH #update" do
  end

  describe "PATCH #upvote" do
  end

  describe "DELETE #destroy" do
  end
end
