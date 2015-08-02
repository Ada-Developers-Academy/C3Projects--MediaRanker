class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def edit
    render 'shared/form'
  end

  def update
    @medium.update(album_params)
    if @medium.save
      redirect_to @medium
    else
      render 'shared/form'
    end
  end

  def show
    render 'shared/show'
  end

  def upvote
    @medium.add_vote
    
    redirect_to @medium
  end

  def destroy
    @medium.destroy

    redirect_to albums_path
  end
end
