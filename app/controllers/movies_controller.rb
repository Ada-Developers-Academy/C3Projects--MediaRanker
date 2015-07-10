class MoviesController < ApplicationController

  def index
    @movies = Movie.order('ranking DESC')
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(create_params[:movie])
    @movie.ranking = 0

    if @movie.save
      redirect_to movie_path(@movie.id)
    else
      render :new
    end
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def update
    @movie = Movie.find(params[:id])

    new_name = params[:movie][:name]
    new_director = params[:movie][:director]
    new_description = params[:movie][:description]

    @movie.update(name: new_name,
                director: new_director,
                description: new_description
                )

    if @movie.save
       redirect_to movie_path(@movie.id)
    else
      render :edit
    end
  end

  def destroy
    show
    @movie.destroy

    redirect_to movies_path
  end

  def upvote
    show
    @movie.ranking += 1
    @movie.save

    redirect_to movie_path(@movie.id)
  end

# ______________________________________________________________________
  private

  def create_params
    params.permit(movie: [:name, :director, :description, :ranking])
  end
end
