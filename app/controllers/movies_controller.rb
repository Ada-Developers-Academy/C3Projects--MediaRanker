class MoviesController < ApplicationController
  before_action :find_all_media, only: [:index]
  before_action :create_medium, only: [:index, :new, :create]
  before_action :find_media, only: [:show, :edit, :update, :destroy, :upvote]

  def create
    @medium.create(create_params[:movie])
  end

  def update
    @media.update(create_params[:movie])
  end

  private

    def create_params
      params.permit(movie: [:name, :creator, :description, :rank])
    end

    def find_all_media
      @all_media = Movie.all.rank_order
    end

    def find_media
      # find a specific instance based on params
      @media = Movie.find(params[:id])
    end

    def create_medium
      # medium is the new instance
      @medium = Movie.new
    end
end
