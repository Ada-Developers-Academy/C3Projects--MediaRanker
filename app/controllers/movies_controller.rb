class MoviesController < ApplicationController
  def self.model
    Movie
  end

  def index
    @movies = Movie.ranking_order
  end

  def create
    @movie = Movie.create(create_params[:movie])

    if @movie.save
      redirect_to movie_path(@movie)
    else
      render :new
    end
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
      if @movie.save
        redirect_to movie_path(@movie)
      else
        render :edit
      end
    else
      new_ranking = @movie.ranking + 1
      @movie.update(ranking: new_ranking)
      redirect_to movie_path(@movie)
    end
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy

    redirect_to movies_path
  end

  private

  def create_params
    params.permit(movie: [:name, :director, :description, :ranking])
  end
end
