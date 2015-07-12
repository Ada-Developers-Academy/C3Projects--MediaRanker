require_relative '../helpers/media_helper.rb'

class MediaController < ApplicationController
  include MediaHelper

  before_action :set_object, only: [:show, :edit, :update, :destroy]

  def index
    @objects = Medium.all_objects(params[:format])
  end

  def show
  end

  def new
    # TODO: come back to this, obviously
    @object = Medium.new(format: "movie")
  end

  def create
    if object = Medium.create(medium_params)
      redirect_to object_path(object)
    else
      #TODO: something
    end
  end

  def edit
  end

  def update
    if params[:upvote] == "true"
      Medium.upvote(@object)
      redirect_to object_path(@object)
    elsif @object.update(medium_params)
      redirect_to object_path(@object)
    else
      #TODO: add error message
      render :edit
    end
  end

  def destroy
    path_holder = objects_path(@object)
    if @object.destroy
      redirect_to path_holder
    else
      #TODO: something
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
