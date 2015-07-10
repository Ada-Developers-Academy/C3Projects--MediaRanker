require_relative '../helpers/media_helper.rb'

class MediaController < ApplicationController
  include MediaHelper

  before_action :set_object, only: [:show, :edit, :update]

  def index
    @objects = Medium.all_objects(request.path)
  end

  # # implicitly defined
  # def show
  # end

  def new
    # TODO: come back to this, obviously
    @object = Medium.new(format: "movie")
  end

  # TODO: def create

  # # implicitly defined
  # def edit
  # end

  def update
    if params[:upvote] == "true"
      Medium.upvote(@object)
      redirect_to :show, @object
    elsif @object.update(medium_params)
      redirect_to object_path(@object)
    else
      #TODO: add error message
      render :edit
    end
  end

  private
    def set_object
      @object = Medium.find(params[:id])
    end

    def medium_params
      params.require(:medium).permit(:title, :creator, :description, :format)
    end
end

## TODO: can use as an example
# class MoviesController < ApplicationController
#   before_action :set_movie, only: [:show, :edit, :update, :destroy]

#   def new
#     @movie = Movie.new
#   end

#   def create
#     if movie = Movie.create(movie_params)
#       redirect_to movie_path(movie)
#     else
#       #TODO: something
#     end
#   end

#   def destroy
#     if @movie.destroy
#       redirect_to movies_path
#     else
#       #TODO: something
#     end
#   end

#   private
#   def set_movie
#     @movie = Movie.find(params[:id])
#   end

#   def movie_params
#     params.require(:movie).permit(:title, :directed_by, :description)
#   end
# end
