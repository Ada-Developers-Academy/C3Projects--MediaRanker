class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def create
    redirect_to action: :index
  end

  def update
    redirect_to action: :show, id: params[:id]
  end

  def destroy
    redirect_to action: :index
  end
  
end
