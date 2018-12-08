class CommentsController < ApplicationController
  # POST /comments
  # POST /comments.json
  def create
    @comment = @commentable.comments.new(comment_params)

    respond_to do |format|
      if @comment.save
        PusherService.push(@comment.attributes)
        redirect_to @commentable_redirect, notice: t(:comment_success_create)
      else
        format.js { render template: 'comments/alert_comment_save' }
        format.html { redirect_to @commentable_redirect, alert: t(:error_comment_create) }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_comment
    @comment = Comment.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def comment_params
    params.require(:comment).permit(:author, :content)
  end
end
