class MoviesController < ApplicationController

  def index
    @media = Movie.all.order(rank: :desc)
    # defining medium allows me to use polymorphic paths for new from the index page
    @medium = Movie.new
  end

  def show
    @media = Movie.find(params[:id])
  end

  def new
    @media = Movie.new
  end

  def create
    @media = Movie.new(create_params[:movie])
    @media.save
    redirect_to movie_path(@media)
  end

  def edit
    @media = Movie.find(params[:id])
  end

  def update
    @media = Movie.find(params[:id])
    @media.update(create_params[:movie])
    redirect_to movie_path(@media)
  end

  def destroy
    @media = Movie.find(params[:id])
    @media.destroy
    redirect_to movies_path
  end

  def upvote
    @media = Movie.find(params[:id])
    @media.add_a_vote
    @media.save
    render :show
  end


  private

  def create_params
    params.permit(movie: [:name, :creator, :description, :rank])
  end


end
