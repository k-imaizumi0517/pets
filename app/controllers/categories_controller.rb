class CategoriesController < ApplicationController
  before_action :set_category, only: [:show]

  def show
    @posts = Post.includes(:user).where(category_id: @category.id).order("created_at DESC").page(params[:page]).per(9)
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end
end
