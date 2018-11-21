class CategoriesController < ApplicationController
  before_action :set_categories, only: [:index, :create, :update]
  before_action :set_category, only: [:edit, :update, :destroy, :show]

  def index
  end

  def new
    @category = Category.new
    respond_to do |f|
      f.js { render template: 'categories/modal' }
    end
  end

  def create
    @category = Category.new(category_params)
    respond_to do |f|
      if @category.save
        f.html { redirect_to root_path, notice: t(:success_create) }
      else
        f.html { redirect_to root_path, alert: t(:error_create) }
      end
    end
  end

  def show
    @posts = @category.posts.page(params[:page]).order(created_at: :desc)
    @comments = @category.comments.page(params[:page]).order(created_at: :desc)
  end

  def edit
    respond_to do |f|
      f.js { render template: 'categories/modal' }
    end
  end

  def update
    respond_to do |f|
      if @category.update(category_params)
        f.html { redirect_to root_path, notice: t(:success_update) }
      else
        f.html { redirect_to root_path, alert: t(:error_update) }
      end
    end
  end

  def destroy
    @category.destroy
    respond_to do |f|
      f.html { redirect_to root_path, notice: t(:success_destroy) }
    end
  end

  private

  def category_params
    params.require(:category).permit(:name, :description)
  end

  def set_categories
    @categories = Category.page(params[:page]).order(created_at: :desc)
  end

  def set_category
    @category = Category.find(params[:id])
  end
end
