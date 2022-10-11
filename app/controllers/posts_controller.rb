class PostsController < ApplicationController
  def index
    @users = User.all
    @user = User.find(params[:user_id])
    @posts = Post.where(author_id: params[:user_id])
    @comments = Comment.all.includes([:post])
  end

  def show
    @current_user = current_user
    @post = Post.find(params[:id])
    @user = User.find(params[:user_id])
    @comments = Comment.where(post_id: params[:id]).includes([:post])
    @users = User.all
  end

  def new
    @current_user = current_user
    @post = Post.new
  end

  def create
    @current_user = current_user
    @post = @current_user.posts.create(post_params)

    if @post.save
      redirect_to posts_path(@current_user.id)
      flash[:success] = 'Your post was save!'
    else
      flash.now[:error] = 'Error: Your post was not saved!'
      render :new
    end
  end

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
