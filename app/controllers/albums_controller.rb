class AlbumsController < ApplicationController

  def create
    @medium.create(create_params[:album])
  end

  def update
    @media.update(create_params[:album])
  end

  private

    def create_params
      params.permit(album: [:name, :creator, :description, :rank])
    end
end
