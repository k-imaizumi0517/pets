class CategoriesController < ApplicationController
  before_action :set_item, only: [:show]

  def show
    @posts = Post.where(category_id: @category.id).order("created_at DESC")
  end

  private

  def set_item
    @category = Category.find(params[:id])
  end
end
