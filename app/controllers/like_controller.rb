class LikesController < ApplicationController
  def create
    @current_user = current_user
    @current_post = Post.find(params[:id])
    @like = Like.new
    @like.author = @current_user
    @like.post = @current_post

    if @like.save
      flash[:success] = 'Your like was added!'
      redirect_to post_path(@current_user.id)
    else
      flash.now[:error] = 'Error: Like was not added'
    end
  end
end