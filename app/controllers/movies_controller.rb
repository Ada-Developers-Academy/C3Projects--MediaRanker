class MoviesController < ApplicationController

  def index
    @media = Movie.all.order(rank: :desc)
  end

  def show
    @movie = Movie.find(params[:id])
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
