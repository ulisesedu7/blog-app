class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @posts = Post.where(author_id: params[:id]).order(updated_at: :desc).first(3)
  end
end
