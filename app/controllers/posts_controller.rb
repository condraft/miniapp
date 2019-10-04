class PostsController < ApplicationController

  before_action :move_to_index, except: [:index, :show]

  def index
    @post = Post.includes(:user).page(params[:page]).per(5).order("created_at DESC")
  end
  
  def new
  end
  
  def create
    Post.create(image: post_params[:image], text: post_params[:text], user)
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy if post.user_id == current_user.id
  end

  private
  def post_params
    params.permit(:image, :text)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

end
