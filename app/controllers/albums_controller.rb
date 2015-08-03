class AlbumsController < ApplicationController
  before_action :find_all_media, only: [:index]
  before_action :create_medium, only: [:index, :new, :create]
  before_action :find_media, only: [:show, :edit, :update, :destroy, :upvote]

  def create
    @medium = Album.new(create_params[:album])
    @medium.save
    redirect_to albums_path
  end

  def update
    @media.update(create_params[:album])
    redirect_to album_path(@media)
  end

  private

    def create_params
      params.permit(album: [:name, :creator, :description, :rank])
    end

    def find_all_media
      @all_media = Album.all.rank_order
    end

    def find_media
      # find a specific instance based on params
      @media = Album.find(params[:id])
    end

    def create_medium
      # medium is the new instance
      @medium = Album.new
    end
end
