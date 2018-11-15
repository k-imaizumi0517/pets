class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]
  before_action :move_to_top, except: [:show]

  def show
    @posts = @user.posts.includes(:user).order("created_at DESC").page(params[:page]).per(9)
    @dogs = @user.dogs.order("created_at DESC")
  end

  def edit
    redirect_to root_path unless current_user.id == @user.id
  end

  def update
    if current_user.id == @user.id
      if current_user.update(user_params)
        redirect_to user_path(current_user), notice: 'プロフィール登録しました'
      else
        render :edit
      end
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:nickname, :image, :prefecture_id, :introduction)
  end

  def move_to_top
    redirect_to root_path unless user_signed_in?
  end
end
