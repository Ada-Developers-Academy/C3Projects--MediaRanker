class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def index; end

  def show; end

  def new; end

  def create
    @medium.create(create_params[:media])
    redirect_to polymorphic_path(@medium)
  end

  def edit; end

  def update
    @media.update(create_params[:media])
    redirect_to polymorphic_path(@media)
  end

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
