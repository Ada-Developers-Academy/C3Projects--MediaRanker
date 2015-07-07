class MoviesController < ApplicationController
  def index
    @movies = Movie.all

  end

  def create
    @new_movie = Movie.create(create_params[:movie])
    @new_movie.save

    redirect_to movie_path(@new_movie.id)
  end

  def new
    @movie = Movie.new
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def show
    @movie = Movie.find(params[:id])

  end

  def update
    @movie = Movie.find(params[:id])

    if params[:movie]
      new_name        = params[:movie][:name]
      new_director    = params[:movie][:director]
      new_description = params[:movie][:description]

      @movie.update(           name: new_name,
                           director: new_director,
                        description: new_description
      )
    else
      new_ranking = @movie.ranking + 1
      @movie.update(ranking: new_ranking)
    end
    
    redirect_to movie_path(@movie.id)
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy

    redirect_to movies_path
  end

  def upvote
    @movie = Movie.find(params[:id])
    new_ranking = @movie.ranking + 1

    @movie.update(ranking: new_ranking)

    redirect_to movie_path(@movie.id)
  end

  private

  def create_params
    params.permit(movie: [:name, :director, :description, :ranking])
  end
end
