require 'spec_helper'

RSpec.shared_examples "medium" do

  describe "GET #show" do
    it "locates the correct described_class.model" do
      medium1 = described_class.model.new(id: 1, title: "a title")
      medium1.save
      medium2 = described_class.model.new(id: 2, title: "b title")
      medium2.save
      params = { id: 2 }

      expect(described_class.model.find(params[:id]).title).to eq("b title")
    end

    it "renders the :show view" do
      medium = described_class.model.new(id: 1, title: "a title")
      medium.save
      get :show, id: 1

      expect(response).to render_template("show")
    end
  end

  describe "GET #edit" do
    # copy pasta'd from GET #show
    # is this even good? NOPE. Re-do!
    it "locates the correct medium" do
      @medium1 = described_class.model.new(id: 1, title: "a title")
      @medium1.save
      medium2 = described_class.model.new(id: 2, title: "b title")
      medium2.save
      params = { id: 2 }

      expect(described_class.model.find(params[:id]).title).to eq("b title")
    end
  end

  describe "PUT #update" do
    before :each do
      medium1 = described_class.model.new(id: 1, title: "a title")
      medium1.save
      @medium2 = described_class.model.new(id: 2, title: "b title")
      @medium2.save
      described_class.model.new(id: 3, title: "c title").save

      @params = { described_class.model.name.downcase.to_sym => { title: "If You're Reading This It's Too Late", description: "" }, id: "2" }
    end

    it "locates the correct described_class.model" do
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
      expect(subject).to redirect_to("/#{described_class.model.name.downcase}s/#{@params[:id]}")
    end
  end
end
