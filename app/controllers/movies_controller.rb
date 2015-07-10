class MoviesController < ApplicationController
 
  def index
    @movies = Movie.all
  end

  def create
    @movie = Movie.new(permit_params[:movie])
    if @movie.save
      redirect_to"movies"
    else
      render :new
    end
  end

  def new
    @movie = Movie.new

    render :new
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def edit #GET one movie to modify.
   @movie = Movie.find(params[:id])   
  end

  def update #PATCH this updated movie to the db
    @movie = Movie.find(params[:id]) 
    @movie.name = permit_params[:movie][:name]
    @movie.director = permit_params[:movie][:director]
    @movie.description = permit_params[:movie][:description]
    @movie.save
    
    redirect_to(movie_path(Movie.find(@movie.id))) 
  end

  def yes_vote # PATCH increase this number by one in the db
   @movie = Movie.find(params[:id])
   # @movie.vote += 1
   # @movie.save
    @movie.increment!(:vote)
  redirect_to(movie_path(Movie.find(@movie.id)))
  end

  def destroy
    @movie = Movie.find(params[:id]).destroy

    redirect_to(movies_path)
  end

  private

  def permit_params
    params.permit(movie:[:name, :director, :description, :vote])
  end

end
