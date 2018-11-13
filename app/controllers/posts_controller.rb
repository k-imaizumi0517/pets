class PostsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]
  before_action :set_post, only: [:show, :edit, :update]

  def index
    # @categories = Category.all
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
    @post = Post.new(title: post_params[:title], text: post_params[:text], category_id: post_params[:category_id], user_id: current_user.id)
    if @post.save
      redirect_to root_path, notice: '投稿しました'
    else
      render :new
    end
  end

  def edit
    redirect_to root_path unless current_user.id == @post.user_id
  end

  def update
    if current_user.id == @post.user_id
      if @post.update(post_params)
        redirect_to post_path(@post), notice: '編集しました'
      else
        render :edit
      end
    end
  end

  def destroy
  end

  private

  def post_params
    params.require(:post).permit(:title, :text, :category_id)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

  def set_post
    @post = Post.find(params[:id])
  end
end

