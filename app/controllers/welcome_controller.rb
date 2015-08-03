class WelcomeController < ApplicationController

  def index
    @movies  = Movie.best(NUMBER_OF_TOP_MEDIA_TO_DISPLAY)
    @books   = Book.best(NUMBER_OF_TOP_MEDIA_TO_DISPLAY)
    @albums  = Album.best(NUMBER_OF_TOP_MEDIA_TO_DISPLAY)
  end

end
