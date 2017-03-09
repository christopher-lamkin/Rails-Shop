class CategoriesController < ApplicationController
  before_action :authenticate_admin, except: [:index, :show]

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:success] = "Category created successfully!"
      redirect_to @category
    else
      render 'new'
      flash[:error] = "Failed to create category."
    end
  end

  def index
    @categories = Category.all
  end

  def show
    @category = Category.all
    @products = @category.products
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    if @category.update(category_params)
      flash[:success] = "You have successfully updated #{@category.name}"
      redirect_to @category
    else
      render 'Edit'
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    flash[:success] = "Category successfully destroyed!"
    redirect_to_categories_path
  end

  private
  def category_params
    params.require(:category).permit(:name)
  end
end
