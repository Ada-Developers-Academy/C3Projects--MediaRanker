class MoviesController < ApplicationController

  def index
    @media = Movie.all.order(rank: :desc)
  end

  def show
    @media = Movie.find(params[:id])
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(create_params[:movie])
    @movie.save
    redirect_to movie_path(@movie.id)
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def update
    @movie = Movie.find(params[:id])
    @movie.update(create_params[:movie])
    redirect_to movie_path(@movie)
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    redirect_to movies_path
  end

  def upvote
    @movie = Movie.find(params[:id])
    @movie.add_a_vote
    @movie.save
    render :show
  end


  private

  def create_params
    params.permit(movie: [:name, :creator, :description, :rank])
  end


end
