require 'rails_helper'

RSpec.describe MediaController, type: :controller do
  include MediaHelper

  let(:format_strings) { ["movie", "book", "album"] }
  let(:one_of_each_format) { [movie, book, album] }
  let(:movie) { Medium.create( { title: "I am a movie", format: "movie" } ) }
  let(:book) { Medium.create( { title: "I am a book", format: "book" } ) }
  let(:album) { Medium.create( { title: "I am a album", format: "album" } ) }

  describe "private methods" do
    describe "#set_object" do
      it "finds object and sets it to @object" do
        params = {}
        allow(controller).to receive(:params).and_return(id: movie.id)
        expect(controller.send(:set_object)).to eq(movie)
      end

      context "when object does not exist" do
        # TODO
      end
    end
  end

  describe "GET #index" do
    before :all do
      @record1 = Medium.create( { :title=>"Kitties Album", :creator=>"Cat", :votes=>9, :description=>"", :format=>"album" } )
      @record2 = Medium.create( { :title=>"Llamas Movie", :creator=>"The Llama", :votes=>6, :format=>"movie" } )
      @record3 = Medium.create( { :title=>"Puppies Album", :creator=>"Dog", :votes=>10, :description=>"", :format=>"album" } )
      @record4 = Medium.create( { :title=>"Elephants Album", :creator=>"Elephant", :description=>"", :format=>"album" } )
      @record5 = Medium.create( { :title=>"Puppies Book", :creator=>"Dog", :votes=>10, :description=>"", :format=>"book" } )
      @record6 = Medium.create( { :title=>"Llamas Album", :creator=>"The Llama", :votes=>6, :description=>"", :format=>"album" } )
      @record7 = Medium.create( { :title=>"Kitties Movie", :creator=>"Cat", :votes=>9, :format=>"movie" } )
      @record8 = Medium.create( { :title=>"Puppies Movie", :creator=>"Dog", :votes=>10, :format=>"movie" } )
      @record9 = Medium.create( { :title=>"Kitties Book", :creator=>"Cat", :votes=>9, :description=>"", :format=>"book" } )
      @record10 = Medium.create( { :title=>"Llamas Book", :creator=>"The Llama", :votes=>6, :description=>"", :format=>"book" } )
      @record11 = Medium.create( { :title=>"Elephants Book", :creator=>"Elephant", :description=>"", :format=>"book" } )
      @record12 = Medium.create( { :title=>"Elephants Movie", :creator=>"Elephant", :description=>"", :format=>"movie" } )
    end

    after :all do
      Medium.destroy_all
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end

    it "assigns @objects for each format" do
      format_strings.each do |format_string|
        objects = Medium.all_objects(format_string)

        get :index, { format: format_string }
        expect(assigns(:objects)).to eq(objects)
        expect(assigns(:objects).count).to eq(4)
      end
    end

    context "when an unexpected format" do
      it "assigns @objects to be nil" do
        get :index, { format: "unknown" }
        expect(assigns(:obects)).to be_nil
        expect(assigns(:objects).count).to eq(0)
      end
    end
  end

  describe "GET #show" do
    it "renders the show template for each format" do
      one_of_each_format.each do |object|
        get :show, { id: object.id }
        expect(response).to render_template("show")
      end
    end

    it "assigns @object (before_action) for each format" do
      one_of_each_format.each do |each_object|
        get :show, { id: each_object.id }
        expect(assigns(:object)).to eq(each_object)
      end
    end
  end

  describe "GET #new" do
    it "renders the new template for each format" do
      format_strings.each do |format_string|
        get :new, { format: format_string }
        expect(response).to render_template("new")
      end
    end

    context "when format is not one of the recognized" do
      it "renders the new template" do
        get :new, { format: "unrecognized format" }
        expect(response).to render_template("new")
      end
    end
  end

  describe "POST #create" do
    context "when params are all valid" do
      let(:media_create_params) do
        [
          { medium: { title: "I am a movie", format: "movie" } },
          { medium: { title: "I am a book", format: "book" } },
          { medium: { title: "I am an album", format: "album" } }
        ]
      end

      it "redirects to #show for each format" do
        media_create_params.each do |medium_create_params|
          post :create, { medium: { title: "I am a movie", format: "movie" } }
          expect(response).to have_http_status(302)
          expect(response).to redirect_to(object_path(Medium.last))
        end
      end

      it "persists record for each format" do
        media_create_params.each do |medium_create_params|
          expect { post :create, medium_create_params }.to change{ Medium.count }
        end
      end
    end

    context "when provided permitted + unpermitted params" do
      let(:media_create_params) do
        [
          { medium: { title: "I am a movie", votes: 9, format: "movie" } },
          { medium: { title: "I am a book", votes: 9, format: "book" } },
          { medium: { title: "I am an album", votes: 9, format: "album" } }
        ]
      end

      it "persists permitted params for all formats" do
        media_create_params.each do |medium_create_params|
          expect { post :create, medium_create_params }.to change{ Medium.count }
        end
      end

      it "rejects unpermitted params for all formats" do
        media_create_params.each do |medium_create_params|
          post :create, medium_create_params
          expect(Medium.last.votes).to eq(0)
        end
      end
    end
  end

  describe "#edit" do
    it "renders the edit template for each format" do
      one_of_each_format.each do |each_object|
        get :edit, { id: each_object.id }
        expect(response).to render_template("edit")
      end
    end

    it "assigns @object (before_action) for each format" do
      one_of_each_format.each do |each_object|
        get :edit, { id: each_object.id }
        expect(assigns(:object)).to eq(each_object)
      end
    end

    context "when object is not recognized" do
      # TODO
    end
  end

  describe "#update" do
     it "assigns @object (before_action) for each format" do
      one_of_each_format.each do |each_object|
        patch :update, { id: each_object.id, medium: { title: "I am an updated #{ each_object.format }", creator: "I am an updated creator", description: "I am an updated description" } }
        expect(assigns(:object)).to eq(each_object)
      end
    end

    it "redirects to #show for each format" do
      one_of_each_format.each do |each_object|
        patch :update, { id: each_object.id, medium: { title: "I am an updated #{ each_object.format }", creator: "I am an updated creator", description: "I am an updated description" } }
        expect(response).to have_http_status(302)
        expect(response).to redirect_to(object_path(assigns(:object)))
      end
    end
  end

  describe "#destroy" do
    it "deletes record for each format" do
      one_of_each_format.each do |each_object|
        delete :destroy, { id: each_object.id }
        expect(Medium.all).to_not include(each_object)
      end
    end

    it "redirects to #index for each format" do
      one_of_each_format.each do |each_object|
        delete :destroy, { id: each_object.id }
        expect(response).to redirect_to(objects_path(each_object))
      end
    end

    context "when object doesn't exist" do
      # TODO
    end
  end
end
