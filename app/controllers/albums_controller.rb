class AlbumsController < ApplicationController
  def index
    @albums = Medium.albums.all_rank
  end
end
