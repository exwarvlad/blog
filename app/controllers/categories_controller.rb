class CategoriesController < ApplicationController
  before_action :set_categories, only: %i[index create update]
  before_action :set_category, only: %i[edit update destroy show]

  def index
  end

  def new
    @category = Category.new
    render template: 'categories/modal'
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      redirect_to root_path, notice: t(:success_create)
    else
      redirect_to root_path, alert: t(:error_create)
    end
  end

  def show
    @posts = @category.posts.page(params[:page])
    @comments = @category.comments
  end

  def edit
    render template: 'categories/modal'
  end

  def update
    if @category.update(category_params)
      redirect_to root_path, notice: t(:success_update)
    else
      redirect_to root_path, alert: t(:error_update)
    end
  end

  def destroy
    if @category.destroy
      redirect_to root_path, notice: t(:success_destroy)
    else
      redirect_to root_path, alert: t(:category_mistake_destroy)
    end
  end

  private

  def category_params
    params.require(:category).permit(:name, :description)
  end

  def set_categories
    @categories = Category.page(params[:page])
  end

  def set_category
    @category = Category.find(params[:id])
  end
end
