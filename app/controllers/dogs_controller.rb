class DogsController < ApplicationController
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

  private

  def dog_params
    params.require(:dog).permit(:name, :image, :age_id, :type_id, :introduction).merge(user_id: current_user.id)
  end
end
