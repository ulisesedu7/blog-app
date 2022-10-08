class CommentController < ApplicationController
  def create
    def create
      @current_user = current_user
      @current_post = Post.find(params[:id])
      @comment = Comment.new(comment_params)
      @comment.author = @current_user
      @comment.post = @current_post
  
      if @comment.save
        flash[:success] = 'Your comment was saved!'
        redirect_to post_path(@current_user.id)
      else
        flash.now[:error] = 'Error: Comment was not saved'
      end
    end
  end

  def comment_params
    params.require(:comment).permit(:author, :post, :text)
  end
end