require 'rails_helper'

RSpec.describe MoviesController, type: :controller do
  describe MoviesController do
    it_behaves_like "a media controller"
  end
  
  describe "POST #create" do
    context "Valid movie params" do
      let(:movie_params) do
        {
          movie: {
            name: 'movie name',
            director: 'director name',
            description: 'some descrip'
          }
        }
      end

      it "creates an Movie record" do
        post :create, movie_params
        expect(Movie.count).to eq 1
      end

      it "redirects to the Movie show page" do
        post :create, movie_params
        expect(subject).to redirect_to(movie_path(assigns(:movie)))
      end
    end

    context "Invalid params" do
      let(:movie_params) do
        {
          movie: {
            director: 'director name',
            description: 'some descrip'
          }
        }
      end

      it "does not persist invalid records" do
        post :create, movie_params
        expect(Movie.count).to eq 0
      end

      it "renders the :new view so user can fix missing data" do
        post :create, movie_params
        expect(subject).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "Editing movie entry" do
      let(:attr) do
        { :name => 'new name', :director => 'new director', :description => 'new description' }
      end

      before :each do
        @old_movie = Movie.create(name: 'old name', director: 'old director', description: 'old descrip')

        put :update, :id => @old_movie.id, :movie => attr
        @old_movie.reload
      end

      it "replaces entry with new info" do
        expect(@old_movie.name).to eq(attr[:name])
        expect(@old_movie.director).to eq(attr[:director])
        expect(@old_movie.description).to eq(attr[:description])
      end

      it "redirects to the Movie show page" do
        expect(subject).to redirect_to(movie_path(assigns(:movie)))
      end
    end

    context "Clicking upvote button" do
      before :each do
        @movie = Movie.create(name: 'name', director: 'director', description: 'descrip')

        put :update, :id => @movie.id
        @movie.reload
        # this update is going through the wrong path in update's if else conditional
      end

      it "increments ranking by 1" do
        expect(@movie.ranking).to eq(1)
      end

      it "redirects to the Movie show page" do
        expect(subject).to redirect_to(movie_path(assigns(:movie)))
      end
    end
  end

  describe "DELETE #destroy" do
    it "deletes existing entry" do
      @movie = Movie.create(name: 'name', director: 'director', description: 'descrip')

      delete :destroy, :id => @movie.id
      expect(Movie.count).to eq(0)
    end
  end
end
