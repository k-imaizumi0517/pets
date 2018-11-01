class PostsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]

  def index
    @new_posts = Post.order("created_at DESC").limit(3)
    @c1_posts = Post.where(category_id: 1).order("created_at DESC").limit(3)
    @c2_posts = Post.where(category_id: 2).order("created_at DESC").limit(3)
    @c3_posts = Post.where(category_id: 3).order("created_at DESC").limit(3)
  end

  def show
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to root_path, notice: '投稿しました'
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def post_params
    params.require(:post).permit(:title, :text, :category_id).merge(user_id: current_user.id)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
end
