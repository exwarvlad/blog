class CategoriesController < ApplicationController
  def index
    @categories = Category.page(params[:page]).order(created_at: :desc)
  end

  def new
  end
end
