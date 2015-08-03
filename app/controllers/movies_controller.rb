class MoviesController < ApplicationController
 
  before_action :select_media, only: [:show, :edit, :update, :yes_vote, :destroy]

  def select_media
    @movie = Movie.find(params[:id])
  end
  
  def index
    @movies = Movie.best(5)
  end

  def create
    @movie = Movie.create(movie_params)
     if @movie.save
      redirect_to(movies_path)
     else
      render :new
     end  
  end

  def new
    @movie = Movie.new

  end

  def show
  end

  def edit #GET one movie to modify.  
  end

  def update #PATCH this updated movie to the db 
    @movie.update(movie_params)
    
    redirect_to(movie_path(@movie.id)) 
  end

  def yes_vote # PATCH increase this number by one in the db
   # @movie.vote += 1  #original method
   # @movie.save
   @movie.increment!(:vote)
  
   redirect_to(movie_path(@movie.id))
  end

  def destroy
    @movie.destroy

    redirect_to(movies_path)
  end

  private

  def movie_params
    params.require(:movie).permit(:name, :director, :description, :vote)
  end

end
