class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :set_active_record_name

  def show
    @current = @active_record_name.find(params[:id])
  end

  def new; end
  def edit; end

  def index
    # active_record_name
    @url_helper = controller_name
    @all_records = @active_record_name.all
  end

  def delete; end

  private

  def set_active_record_name
    @active_record_name = eval(controller_name.classify.singularize)
  end
end
