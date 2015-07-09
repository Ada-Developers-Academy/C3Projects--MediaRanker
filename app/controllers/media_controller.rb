class MediaController < ApplicationController
  before_action :set_category

  def root
    @media = Medium.categorize
  end

  def index
    set_category

    @media = Medium.grab_category(@singular_category)
  end

  def show
    @medium = Medium.find(params[:id])
  end

  def new
    set_category
    @medium = Medium.new(category: @singular_category)
    set_creator(@medium)
  end

  def edit
    @medium = Medium.find(params[:id])
  end

  def upvote
    medium = Medium.find(params[:id])
    medium.increment!(:upvotes, 1)

    redirect_to "#{ base_url medium }"
  end

  def update
    medium = Medium.find(params[:id])
    if medium.update(edit_params)
      redirect_to "#{ base_url medium }"
    else
      redirect_to "#{ base_url medium }/edit"
    end
  end

  def create
    medium = Medium.new(create_params)

    if medium.valid?
      medium.save

      redirect_to "#{ base_url medium }"
    else
      redirect_to "/#{ medium.plural_category }/new"
    end
  end

  def destroy
    medium = Medium.find(params[:id])
    category = medium.plural_category
    medium.destroy

    redirect_to "/#{ category }"
  end

  private

  def base_url(medium)
    "/#{ medium.plural_category }/#{ medium.id }"
  end

  def create_params
    medium = edit_params
    medium[:upvotes] = 0

    return medium
  end

  def edit_params
    params.permit(medium: [:title, :creator, :description, :category])[:medium]
  end

  def set_category
    if request.path.include? "movies"
      @category = "movies"
    elsif request.path.include? "books"
      @category = "books"
    elsif request.path.include? "albums"
      @category = "albums"
    end

    if @category
      @singular_category = singular_category(@category)
    end
  end

  def singular_category(plural)
    return plural.classify
  end

  def set_creator(categorized_medium)
    @creator = categorized_medium.creator_noun
    @created = categorized_medium.created
  end
end
