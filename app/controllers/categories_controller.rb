class CategoriesController < ApplicationController
  before_action :set_category, only:[:show, :edit, :update]
  skip_before_action :verify_authenticity_token

  def index
    @categories = Category.all.sort
    respond_to do |format|
      format.html
      format.json {render json: @categories.to_json}
    end
  end

  def show
    render_formats
  end

  def edit
    render_formats
  end

  def update
    @category.update(category_params)
    if @category.save
      flash[:message] = "Category updated"
      redirect_to category_path
      render_formats
    else
      render :edit
    end
  end

  def create
    @category = Category.new(category_params)
    @category.save
    render_formats
  end

  private

  def category_params
    params.require(:category).permit(:id, :name)
  end

  def set_category
    @category = Category.find_by_id(params[:id])
  end

  def render_formats
    respond_to do |format|
      format.html
      format.json {render json: @category.to_json}
    end
  end

end
