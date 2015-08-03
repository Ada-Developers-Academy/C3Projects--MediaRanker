class MediaController < ApplicationController
  include ApplicationHelper # bring in those URL helpers!
  before_action :set_defaults, except: :root

  def root
    @media = Medium.categorize
  end

  def index
    @media = @category.media.by_upvotes
  end

  def show; end

  def new; end

  def edit; end

  def upvote
    @medium.increment!(:upvotes, 1)

    redirect_to medium_path(@medium)
  end

  def update
    if @medium.update(edit_params)
      redirect_to medium_path(@medium)
    else
      redirect_to edit_medium_path(@medium)
    end
  end

  def create
    @medium = Medium.new(create_params)

    if @medium.valid?
      @medium.save

      redirect_to medium_path(@medium)
    else
      redirect_to new_medium_path(@medium)
    end
  end

  def destroy
    redirect = category_path(@medium.category)
    @medium.destroy

    redirect_to redirect
  end

  private

  def set_defaults
    category = params[:category]

    @category = Category.where(name: category.classify)[0]
    @medium = params[:id] ? Medium.find(params[:id]) : Medium.new(category_id: @category.id)
  end

  def create_params
    medium = edit_params
    medium[:upvotes] = 0
    medium[:category_id] = @category.id

    return medium
  end

  def edit_params
    params.require(:medium).permit(:title, :creator, :description, :category_id)
  end
end
