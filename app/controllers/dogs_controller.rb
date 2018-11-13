class DogsController < ApplicationController
  before_action :move_to_top, except: [:show]
  before_action :set_dog, only: [:show, :edit, :update]

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

  def edit
    redirect_to :root_path unless current_user.id == @dog.user_id
  end

  def update
    if current_user.id == @dog.user_id
      if @dog.update(dog_params)
        redirect_to dog_path(@dog), notice: '編集しました'
      else
        render :edit
      end
    end
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
