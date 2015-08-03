class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def edit
    render 'shared/form'
  end

  def show
    render 'shared/show'
  end

  def update
    @medium.update(medium_params)
    if @medium.save
      redirect_to @medium
    else
      render 'shared/form'
    end
  end

  def upvote
    @medium.add_vote
    
    redirect_to @medium
  end

  def destroy
    @medium.destroy

    redirect_to media_path
  end

  private

  def media_path
    case controller_name
      when "albums"
        albums_path
      when "books"
        books_path
      when "movies"
        movies_path
    end 
  end

  def medium_params
    case controller_name
      when "albums"
        album_params
      when "books"
        book_params
      when "movies"
        movie_params
    end
  end
end
