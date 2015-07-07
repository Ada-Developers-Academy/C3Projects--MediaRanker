class AlbumsController < ApplicationController

  def index
    @media = Album.all
  end

end
