class CategoriesController < ApplicationController
  before_action :set_params, only: [:show, :edit, :update, :destroy]
  before_action :require_admin, except: [:index, :show]

  def index
    @categories = Category.paginate(page: params[:page], per_page: 5)
  end

  def show
    @articles = @category.articles.paginate(page: params[:page], per_page: 5)
  end
  
  def new
    @category = Category.new
  end

  def edit
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      flash[:notice] = "Category was successfully created"
      redirect_to @category
    else
      render "new"
    end
  end

  def update
    if @category.update(category_params)
      flash[:notice] = "Category was successfully updated"
      redirect_to @category
    else
      render "edit"
    end
  end

  private

  def set_params
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name)
  end

  def require_admin
    if !(logged_in? && current_user.admin?)
      flash[:alert] = "Onluy admin can perform this action"
      redirect_to categories_path
    end
  end

end 
