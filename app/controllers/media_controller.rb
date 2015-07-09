class MediaController < ApplicationController
  before_action :set_defaults
  skip_before_action :set_defaults, only: :root

  def root
    @media = Medium.categorize
  end

  def index
    @media = @category.media.by_upvotes
  end

  def show
    @medium = Medium.find(params[:id])
  end

  def new; end

  def edit
    @medium = Medium.find(params[:id])
  end

  def upvote
    @medium = Medium.find(params[:id])
    @medium.increment!(:upvotes, 1)

    redirect_to "#{ base_url }"
  end

  def update
    medium = Medium.find(params[:id])
    if medium.update(edit_params)
      redirect_to "#{ base_url }"
    else
      redirect_to "#{ base_url }/edit"
    end
  end

  def create
    @medium = Medium.new(create_params)

    if @medium.valid?
      @medium.save

      redirect_to "#{ base_url }"
    else
      redirect_to "/#{ base_url }/new"
    end
  end

  def destroy
    medium = Medium.find(params[:id])
    category = medium.plural_category
    medium.destroy

    redirect_to "/#{ category }"
  end

  private

  def base_url
    id = params[:id] || @medium.id
    return id ? "/#{ @medium.category.plural }/#{ id }" : "/#{ @medium.category.plural }"
  end

  def set_defaults
    path = request.path.split("/")
    category = path[1] # 0 is "" because path is like: /movies/134

    @category = Category.where(name: category.classify)[0]
    @medium = Medium.new(category_id: @category.id)
  end

  def create_params
    medium = edit_params
    medium[:upvotes] = 0

    return medium
  end

  def edit_params
    params.permit(medium: [:title, :creator, :description, :category_id])[:medium]
  end
end
