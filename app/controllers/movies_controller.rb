class MoviesController < ApplicationController

  def index
    @media = Movie.all.order(rank: :desc)
  end

  def show
    @movie = Movie.find(params[:id])
  end

    def new
    @movie = Movie.new
    @director = @movie.director
  end

  def create
    @movie = Movie.new(create_params[:movie])
    @director = @movie.director
    @movie.save
    redirect_to movie_path(@movie.id)
  end

  def edit
    @movie = Movie.find(params[:id])
    @director = @movie.director
  end

  def update
    @movie = Movie.find(params[:id])
    @director = @movie.director
    @movie.update(create_params[:movie])
    redirect_to movie_path(@movie.id)
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    redirect_to movies_path
  end

  def add_a_vote
    @movie = Movie.find(params[:id])
    @movie.rank += 1
  end

  def upvote
    @movie = Movie.find(params[:id])
    @movie.add_a_vote
    @movie.update(create_params[:rank])
    render :show
  end


  private

  def create_params
    params.permit(movie: [:name, :director, :description, :rank])
  end


end
