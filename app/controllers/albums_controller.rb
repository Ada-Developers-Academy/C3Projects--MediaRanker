class AlbumsController < ApplicationController
  def index
    @albums = Medium.albums
  end
end
