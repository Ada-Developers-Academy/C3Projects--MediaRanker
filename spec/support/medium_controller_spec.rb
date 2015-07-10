require 'spec_helper'

RSpec.shared_examples "medium" do

  let(:medium_model_name){ described_class.model.name.downcase }

  describe "find_medium" do
    it "locates the correct object" do
      medium1 = described_class.model.new(id: 1, title: "a title")
      medium1.save
      medium2 = described_class.model.new(id: 2, title: "b title")
      medium2.save
      params = { id: 2 }

      expect(described_class.model.find(params[:id]).title).to eq("b title")
    end
  end

  describe "GET #index" do
    before :each do
      @medium1 = described_class.model.new(id: 1, title: "a title", ranking: 5)
      @medium1.save
      @medium2 = described_class.model.new(id: 2, title: "b title", ranking: 10)
      @medium2.save
    end

    it "locates all the objects" do
      get :index
      num_of_media = described_class.model.all.count

      expect(assigns["#{medium_model_name}s".to_sym].count).to eq num_of_media
    end

    it "provides the objects in descending order" do
      get :index

      expect(assigns["#{medium_model_name}s".to_sym].first.ranking).to eq @medium2.ranking
      expect(assigns["#{medium_model_name}s".to_sym].last.ranking).to eq @medium1.ranking
    end
  end

  describe "GET #upvote" do
    before :each do
      # why can't this be `let`?!?!
      @medium = described_class.model.new(id: 1, title: "a title")
      @medium.save
    end

    it "increases the medium's ranking by 1" do
      old_ranking = @medium.ranking
      get :upvote, id: @medium.id

      expect(assigns["#{medium_model_name}".to_sym].ranking).to eq old_ranking + 1
    end

    it "renders the :show view" do
      get :upvote, id: @medium.id

      expect(response).to render_template("show")
    end
  end

  describe "POST #create" do
    # let(:params){ medium_model_name.to_sym => { title: "If You're Reading This It's Too Late", description: "" } }
    # creates a new instance

    # # redirects
    # it "redirects to the medium's :show view" do
    #   put :create, params
    #   expect(subject).to redirect_to("/#{medium_model_name}s/#{assigns[medium_model_name.to_sym]}")
    # end
  end

  describe "GET #show" do
    it "renders the :show view" do
      medium = described_class.model.new(id: 1, title: "a title")
      medium.save
      get :show, id: 1

      expect(response).to render_template("show")
    end
  end

  describe "PUT #update" do
    before :each do
      medium1 = described_class.model.new(id: 1, title: "a title")
      medium1.save
      @medium2 = described_class.model.new(id: 2, title: "b title")
      @medium2.save
      described_class.model.new(id: 3, title: "c title").save

      @params = { medium_model_name.to_sym => { title: "If You're Reading This It's Too Late", description: "" }, id: "2" }
    end

    it "locates the correct object" do
      params = { id: 1 }
      expect(described_class.model.find(params[:id]).title).to eq("a title")
    end

    it "updates and saves the new information" do
      original_title       = @medium2.title
      # removed check for .artist/.director/.author
      # felt like unnecessary overcomplication
      original_description = @medium2.description
      put :update, @params
      @medium2.reload

      expect(@medium2.title).to_not       eq original_title
      expect(@medium2.description).to_not eq original_description
    end

    it "doesn't create a new object" do
      original_count = described_class.model.all.count
      put :update, @params

      expect(original_count).to eq described_class.model.all.count
    end

    it "redirects to the medium's :show view" do
      put :update, @params
      expect(subject).to redirect_to("/#{medium_model_name}s/#{@params[:id]}")
    end
  end

  describe "DELETE #destroy" do
    before :each do
      medium1 = described_class.model.new(id: 1, title: "a title")
      medium1.save
      @medium2 = described_class.model.new(id: 2, title: "b title")
      @medium2.save
      @params = { medium_model_name.to_sym => { title: "If You're Reading This It's Too Late", description: "" }, id: 1 }
    end
    # removes object

    # redirects
    it "redirects to the medium's :show view" do
      delete :destroy, @params
      expect(subject).to redirect_to(media_path)
    end
  end
end
