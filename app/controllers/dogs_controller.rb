class DogsController < ApplicationController
  before_action :move_to_top, except: [:show]
  before_action :set_dog, only: [:show]

  def new
    @dog = Dog.new
  end

  def create
    @dog = Dog.new(dog_params)
    if @dog.save
      redirect_to user_path(current_user), notice: '登録しました'
    else
      render :new
    end
  end

  def show
  end

  private

  def dog_params
    params.require(:dog).permit(:name, :image, :age_id, :type_id, :introduction).merge(user_id: current_user.id)
  end

  def move_to_top
    redirect_to root_path unless user_signed_in?
  end

  def set_dog
    @dog = Dog.find(params[:id])
  end
end
