class PostsController < ApplicationController
  before_action :set_post, only: %i[show edit update destroy]

  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.all
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @comments = @post.comments
  end

  # GET /posts/new
  def new
    @post = Post.new
    render template: 'categories/modal'
  end

  # GET /posts/1/edit
  def edit
    render template: 'categories/modal'
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to category_path(@post.category_id), notice: t(:post_success_create)
    else
      redirect_to category_path(params[:category_id]), alert: t(:error_post_create)
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    if @post.update(post_params)
      redirect_to category_path(@post.category_id), notice: t(:post_success_update)
    else
      redirect_to category_path(params[:category_id]), alert: t(:error_post_update)
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    if @post.destroy
      redirect_to category_path(params[:category_id]), notice: t(:post_success_destroy)
    else
      redirect_to category_path(@post.category_id), notice: t(:post_mistake_destroy)
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_post
    @post = Post.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def post_params
    params.require(:post).permit(:name, :content, :file).merge(category_id: params[:category_id])
  end
end
