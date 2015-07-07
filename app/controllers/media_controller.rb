class MediaController < ApplicationController
  before_action :set_active_record_name

  def root
    @categorized_records = Medium.categorize
  end

  def show
    @current_record = Medium.find(params[:id])
  end

  def new; end

  def edit
    @current_record = Medium.find(params[:id])
  end

  def index
    @singular_category = params[:category].singularize.capitalize
    @all_records = Medium.where(category: @singular_category)
    @category = params[:category]
  end

  def delete; end

  private

  def set_active_record_name
    @active_record_name = eval(controller_name.classify.singularize)
  end
end
