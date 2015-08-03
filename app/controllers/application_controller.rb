class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def index; end

  def show; end

  def new; end

  def edit; end

  def destroy
    @media.destroy
    redirect_to polymorphic_path(@media.class)
  end

  def upvote
    @media.add_a_vote
    @media.save
    render :show
  end
end
