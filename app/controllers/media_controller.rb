class MediaController < ActionController::Base
  before_action :set_active_record_name

  def root
    # # doesn't work
    # @categories = Category.all.map { |cat| cat.name }

    @categories = [Movie, Book, Album]
  end

  def show
    @current_record = @active_record_name.find(params[:id])

    render :show
  end

  def new
    render :new
  end

  def edit
    @current_record = @active_record_name.find(params[:id])

    render :edit
  end

  def index
    # active_record_name
    @url_helper = controller_name
    @all_records = @active_record_name.all

    render :index
  end

  def delete
    render :delete
  end

  private

  def set_active_record_name
    @active_record_name = eval(controller_name.classify.singularize)
  end
end
