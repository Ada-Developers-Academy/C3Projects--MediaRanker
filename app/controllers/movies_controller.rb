class MoviesController < ApplicationController

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
end
