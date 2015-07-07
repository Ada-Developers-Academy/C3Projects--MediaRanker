class AlbumsController < ApplicationController

  def index
    @all = Album.all
  end

end
