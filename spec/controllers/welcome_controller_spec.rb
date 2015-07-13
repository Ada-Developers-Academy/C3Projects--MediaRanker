require 'rails_helper'

RSpec.describe WelcomeController, type: :controller do
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

    it "assigns @<format> for each format" do
      get :index
      expect(assigns(:movies).count).to eq(4)
      expect(assigns(:books).count).to eq(4)
      expect(assigns(:albums).count).to eq(4)
    end
  end
end
