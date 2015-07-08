class MediaController < ApplicationController
    def index
      if request.path.include?("books")
        @media = Medium.find_books
      elsif request.path.include?("movies")
        @media = Medium.find_movies
      else
        @media = Medium.find_albums
      end
    end

  def new
    @movie = Movie.new
    @method = :post
    
  end

  def create
    @movie = Movie.create(movie_params)
    redirect_to movies_path
  end


  def show
    @media = Medium.find(params[:id])
  end

  def edit
    @movie = Movie.find(params[:id])
    @method = :patch
    if @movie.director.nil?
      @creator = " "
    else
      @creator = @movie.director
    end
  end

  def update
    @movie = Movie.find(params[:id])
    @movie.update(movie_params)
    render :show
  end

  def upvote
    @movie = Movie.find(params[:id])
    @movie.votes += 1
    @movie.save
    @method = :patch
    redirect_to movie_path(@movie.id)
  end

  def destroy
    movie = Movie.find(params[:id])
    movie.destroy
  end

  def movie_params
    params.require(:movie).permit(:name, :description, :director, :votes)
  end
end