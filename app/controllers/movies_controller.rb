class MoviesController < ApplicationController

  def index
    @movies = Movie.all
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def new
    @movie = Movie.new
    render :new
  end

  def create
    @movies = Movie.all
    @new = Movie.new(create_params[:movie])
    @new.save

    render :index
  end

  def edit
    @movie = Movie.find(params[:id])
    render :edit
  end

  def update
    @movie = Movie.find(params[:id])
    movie_params = create_params[:movie]
    @movie.update(movie_params)
    @movie.save
    redirect_to "/movies/#{@movie.id}"
  end


  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    redirect_to "/movies"
  end

  def upvote
    @movie = Movie.find(params[:id])
    @movie.increment!(:vote)
    redirect_to "/movies"
  end

  def downvote
    @movie = Movie.find(params[:id])
    @movie.decrement!(:vote)
    redirect_to "/movies"
  end


private
  def create_params
    params.permit(movie: [:title, :director, :description, :vote])
  end

end
