class MoviesController < ApplicationController

  def create
    @movies = Movie.all
    @new = Movie.new(create_params[:movie])
    @new.save

    render :index
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
    
    redirect_to(root_path) 
  end

  def update_vote # UPDATE increase this number by one in the db
   @movie = Movie.find(params[:id])
   @movie.vote += 1
   @movie.save
 #movie.increment!(:vote)
  redirect_to(movie_path)
  end

  private

  def create_params
    params.permit(movie:[:name, :director, :description, :vote])
  end

end
