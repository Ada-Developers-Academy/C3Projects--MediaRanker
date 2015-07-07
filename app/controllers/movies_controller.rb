class MoviesController < ApplicationController

  def create
    @movie = Movie.new(permit_params[:movie])
    @movie.save

    redirect_to(root_path)
  end

  def new
    @movie = Movie.new
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

  private

  def permit_params
    params.permit(movie:[:name, :director, :description, :vote])
  end

end
