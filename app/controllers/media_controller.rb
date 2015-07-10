require_relative '../helpers/media_helper.rb'

class MediaController < ApplicationController
  include MediaHelper

end

## TODO: can use as an example
# class MoviesController < ApplicationController
#   before_action :set_movie, only: [:show, :edit, :update, :destroy]

#   def index
#     @movies = Movie.all
#   end

#   # # implicitly defined
#   # def show
#   # end

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

#   def edit
#   end

#   def update
#     if params[:upvote] == "true"
#       Movie.upvote(@movie)
#       redirect_to movie_path(@movie)
#     elsif @movie.update(movie_params)
#       redirect_to movie_path(@movie)
#     else
#       #TODO: add error message
#       render :edit
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
