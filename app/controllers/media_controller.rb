class MediaController < ApplicationController
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

    redirect_to "#{ @medium.url }"
  end

  def update
    # medium = Medium.find(params[:id])
    if @medium.update(edit_params)
      redirect_to "#{ @medium.url }"
    else
      redirect_to "#{ @medium.url }/edit"
    end
  end

  def create
    @medium = Medium.new(create_params)

    if @medium.valid?
      @medium.save

      redirect_to "#{ @medium.url }"
    else
      redirect_to "/#{ @medium.url_base }/new"
    end
  end

  def destroy
    url_base = @medium.url_base
    @medium.destroy

    redirect_to "#{ url_base }"
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
    params.permit(medium: [:title, :creator, :description, :category_id])[:medium]
  end
end
