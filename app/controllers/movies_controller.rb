class MoviesController < ApplicationController

  def index
   @movies = Movie.all
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def show
    @movie = Movie.find(params[:id])
  end

  # def upvote
  #   @movie = Movie.find(params[:id])
  #   @movie.votes.create
  #   redirect_to movies_path(@movie.id)
  # end

  def destroy
    Movie.destroy(params[:id])
    redirect_to '/movies'
  end




end
