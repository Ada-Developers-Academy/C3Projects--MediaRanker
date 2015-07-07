class MoviesController < ApplicationController

  def index
    @movies = Movie.all
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(create_params[:movie])
    @movie.save

    render :show
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
                  description: new_description)
    @movies = Movie.all

    render :show
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy

    redirect_to action: :index
  end


  private

  def create_params
    params.permit(movie: [:name, :director, :description])
  end
end
