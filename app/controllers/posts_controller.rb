class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.all
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @comments = @post.comments.order(created_at: :desc)
  end

  # GET /posts/new
  def new
    @post = Post.new
    respond_to do |f|
      f.js { render template: 'categories/modal' }
    end
  end

  # GET /posts/1/edit
  def edit
    respond_to do |f|
      f.js { render template: 'categories/modal' }
    end
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to category_path(@post.category_id), notice: t(:post_success_create) }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { redirect_to category_path(params[:category_id]), alert: t(:error_post_create) }
        format.json { render json: category_path(@post), status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to category_path(@post.category_id), notice: t(:post_success_update) }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { redirect_to category_path(params[:category_id]), alert: t(:error_post_update) }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to category_path(params[:category_id]), notice: t(:post_success_destroy) }
      format.json { head :no_content }
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
