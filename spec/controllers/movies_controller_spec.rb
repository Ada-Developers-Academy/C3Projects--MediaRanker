require 'rails_helper'

RSpec.describe MoviesController, type: :controller do

# INDEX ACTION__________________________________________________________________

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
  end

# SHOW ACTION___________________________________________________________________

  describe "GET #show" do
    before :each do
      @movie = Movie.create(movie_params[:movie])
      @movie.ranking = 0
    end

    let(:movie_params) do
      {
        movie: {
          name: 'a name',
          director: 'a director',
          description: 'a description'
        }
      }
    end

    it "renders the show template" do
      get :show, id: @movie.id
      expect(response).to render_template("show")
    end
  end

# NEW ACTION____________________________________________________________________

  describe "GET #new" do

    it "renders the new template" do
      get :new
      expect(response).to render_template("new")
    end
  end

# CREATE ACTION_________________________________________________________________

  describe "POST #create" do

    context "Valid movie params" do
      before :each do
        @movie = Movie.new(movie_params[:movie])
        @movie.ranking = 0
      end

      let(:movie_params) do
        {
          movie: {
            name: 'a name',
            director: 'a director',
            description: 'a description'
          }
        }
      end

      it "creates a movie record" do
        post :create, movie_params
        expect(Movie.count).to eq 1
      end

      it "redirects to the movie show page" do
        post :create, movie_params
        expect(subject).to redirect_to(movie_path(assigns(:movie)))
      end

      it "a new movie has a 'ranking' equil to 0 by default" do
        post :create, movie_params
        expect(@movie.ranking).to eq_to 0
      end
    end

    context "Invalid movie params" do
      let(:movie_params) do
        {
          movie: {
            director: 'a director',
            description: 'a description'
          }
        }
      end

      it "does not persist invalid records" do
        post :create, movie_params
        expect(Movie.count).to eq 0
      end

      it "renders the :new view if the user didn't enter a name" do
        post :create, movie_params
        expect(response).to render_template("new")
      end
    end
  end

# EDIT ACTION___________________________________________________________________

  describe "GET #edit" do
    before :each do
      @movie = Movie.create(movie_params[:movie])
      @movie.ranking = 0
    end

    let(:movie_params) do
      {
        movie: {
          name: 'a name',
          director: 'a director',
          description: 'a description'
        }
      }
    end

    it "renders the edit template" do
      get :edit, id: @movie.id
      expect(response).to render_template("edit")
    end
  end

# UPDATE ACTION_________________________________________________________________

  describe "PATCH #update" do
    before :each do
      @movie = Movie.create(movie_params[:movie])
    end

    let(:movie_params) do
      {
        movie: {
          name: 'a name',
          director: 'a director',
          description: 'a description'
        }
      }
    end

    # When NAME field in the edit form IS NOT EMPTY
    it "updates a movie record and redirects to the movie show page" do
      patch :update, id: @movie.id, movie: { name: "updated_name" }
      @movie.reload
      expect(@movie.name).to eq("updated_name")
      expect(subject).to redirect_to(movie_path(@movie.id))
    end


    # When NAME field in the edit form IS EMPTY
    it "updates a movie record" do
      patch :update, id: @movie.id, movie: { name: nil }
      @movie.reload
      expect(response).to render_template("edit")
    end
  end


# DELETE ACTION_________________________________________________________________

  describe "DELETE #destroy" do
    before :each do
      @movie = Movie.create(movie_params[:movie])
      @movie.ranking = 0
    end

    let(:movie_params) do
      {
        movie: {
          name: 'a name',
          director: 'a director',
          description: 'a description'
        }
      }
    end

    it "deletes a movie record" do
      @movie.destroy
      expect(Movie.count).to eq 0
    end

    it "redirects to the movie show page" do
      delete :destroy, id: @movie.id
      expect(response).to redirect_to(movies_path)
    end
  end

# UPVOTE ACTION_________________________________________________________________

  describe "PATCH #upvote" do
    before :each do
      @movie = Movie.create(movie_params[:movie])
    end

    let(:movie_params) do
      {
        movie: {
          name: 'a name',
          director: 'a director',
          description: 'a description',
          ranking: 0
        }
      }
    end

    it "upvotes a movie record " do
      patch :upvote, id: @movie.id
      @movie.reload
      expect(@movie.ranking).to eq 1
    end
  end
end
