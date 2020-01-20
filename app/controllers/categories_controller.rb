class CategoriesController < ApplicationController

  before_action :require_admin, except: [:index, :show]

  def index
    @category = Category.paginate(page:params[:page], per_page: 8)
  end

  def new
    @category = Category.new
  end

  def show
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:success] = "Category created OK."
      redirect_to categories_path
    else
      render 'new'
    end
  end

  private
  def category_params
    params.require(:category).permit(:name)
  end

  def require_admin
    if !logged_in? || (logged_in? && !current_user.admin?)
      flash[:danger] = "You need to be logged in as Admin for that."
      redirect_to categories_path
    end
  end


end
